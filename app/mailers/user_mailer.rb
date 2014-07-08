class UserMailer < ActionMailer::Base

  def welcome_mail(user)
    @user = user
    email_with_name = "#{@user.email} <#{@user.email}>"
    mail( to: email_with_name,
          subject: "Invite to Webster management system",
          from: "admin@webstermg.ru",
          delivery_method_options: delivery_options )
  end

  def custom_mail(to, sender_email, sender, subject, text)
    @to = to
    @sender_email = sender_email
    @text = text
    mail( to: to,
          subject: subject,
          reply_to: sender_email,
          from: sender,
          delivery_method_options: delivery_options )
  end

  protected
    
    def delivery_options
      { 
        user_name: Settings.mailer_username,
        password: Settings.mailer_password,
        address: Settings.mailer_host,
        port: Settings.mailer_port
      }
    end

end
