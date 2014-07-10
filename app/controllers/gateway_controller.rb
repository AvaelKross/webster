class GatewayController < ApplicationController
  protect_from_forgery except: [:send_message]

  def send_message
    proj = Project.where(site: request.referer).first
    return render json: {success: false} unless proj.present?
    
    # send mail
    if proj.email_on?
      email_text = "FROM landing page: "+params[:phone]+": "+params[:text]
      proj.send_email(email_text)
    end

    # send sms
    if proj.sms_on?
      sms_text = params[:phone]+": "+params[:text]
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
