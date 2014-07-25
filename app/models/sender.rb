class Sender

  class << self

    def send_sms(message)
      project = message.project
      Smsru::API.send_sms(  project.phone, 
                            message.text, 
                            Settings.sms_api_id, 
                            project.sms_from )
      message.update_columns(status: true)
    end
    handle_asynchronously :send_sms

    def send_email(message)
      project = message.project
      UserMailer.custom_mail( project.email, 
                              project.email_sender_email, "#{project.email_sender} <#{project.email_sender_email}>", 
                              project.email_subject, 
                              message.text )
                            .deliver
      message.update_columns(status: true)
    end
    handle_asynchronously :send_email

  end

end