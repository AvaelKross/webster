class UserMailer < ActionMailer::Base

  def welcome_mail(user)
    @user = user
    email_with_name = "#{@user.email} <#{@user.email}>"
    mail( to: email_with_name,
          subject: "Invite to Webster management system",
          from: "admin@webstermg.ru" )
  end

  def custom_mail(user, sender_email, sender_name, subject, text, from)
    @user = user
    @sender_email = sender_email
    @sender_name = sender_name
    @text = text
    mail( to: @user.email,
          subject: subject,
          reply_to: sender_email,
          from: from )
  end

end
