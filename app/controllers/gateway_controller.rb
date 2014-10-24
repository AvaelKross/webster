class GatewayController < ApplicationController
  protect_from_forgery except: [:send_message]

  def send_message
    p 'hi!'
    proj = Project.where("site LIKE '%#{request.referer.split('?').first}%'").first
    p 'WHAT THE HELL'
    p request.referer
    p params
    p proj
    return render json: {success: false, site: request.referer} unless proj.present?
    
    # send mail
    if proj.email_on?
      email_text = proj.email_template.gsub(/\{(.*?)\}/) {"#{params[$1.to_sym]}"}
      message = Message.create(project: proj, text: email_text, message_type: "email")
      Sender.send_email(message)
    end

    # send sms
    if proj.sms_on?
      sms_text = proj.sms_template.gsub(/\{(.*?)\}/) {"#{params[$1.to_sym]}"}
      message = Message.create(project: proj, text: sms_text, message_type: "sms")
      Sender.send_sms(message)
    end

    render json: {success: true}
  end

end
