class Sender

  class << self

    def send_sms(message)
      project = message.project
      numbers = project.phone.gsub(/\s+/, "").split(",")
      Smsru::API.group_send(  numbers, 
                              message.text, 
                              Settings.sms_api_id, 
                              project.sms_from )
      message.update_columns(status: true)
    end
    handle_asynchronously :send_sms

    def send_email(message)
      project = message.project
      emails = project.email.gsub(/\s+/, "").split(",")
      emails.each do |email|
        UserMailer.custom_mail( email, 
                                project.email_sender_email, "#{project.email_sender} <#{project.email_sender_email}>", 
                                project.email_subject, 
                                message.text )
                              .deliver
      end
      message.update_columns(status: true)
    end
    handle_asynchronously :send_email

  end

end