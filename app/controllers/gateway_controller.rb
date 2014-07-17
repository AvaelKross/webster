class GatewayController < ApplicationController
  protect_from_forgery except: [:send_message]

  def send_message
    proj = Project.where(site: request.referer).first
    return render json: {success: false} unless proj.present?
    
    # send mail
    if proj.email_on?
      email_text = proj.email_template.gsub(/\{(.*?)\}/) {"#{params[$1.to_sym]}"}
      proj.send_email(email_text)
    end

    # send sms
    if proj.sms_on?
      sms_text = proj.sms_template.gsub(/\{(.*?)\}/) {"#{params[$1.to_sym]}"}
      proj.send_sms(sms_text)
    end

    respond_to do |format|
      if params[:callback]
        format.js { render json: {success: true}, callback: params[:callback] }
      else
        format.json { render json: {success: true}}
      end
    end
  end

end
