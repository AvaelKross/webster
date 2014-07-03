class UserMailer < ActionMailer::Base
  default from: Settings.mailer_from

  def welcome_mail(user)
    @user = user
    email_with_name = "#{@user.email} <#{@user.email}>"
    mail( to: email_with_name,
          subject: "Invite to Webster management system" )
  end

  def custom_mail(user, sender_email, sender_name, subject, text)
    @user = user
    @sender_email = sender_email
    @sender_name = sender_name
    @text = text
    mail( to: @user.email,
          subject: subject,
          reply_to: sender_email )
  end

end
