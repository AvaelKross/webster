class UserMailer < ActionMailer::Base

  def welcome_mail(user)
    @user = user
    email_with_name = "#{@user.email} <#{@user.email}>"
    mail( to: email_with_name,
          subject: "Invite to Webster management system",
          from: "admin@webstermg.ru" )
  end

  def custom_mail(to, sender_email, sender, subject, text)
    @to = to
    @sender_email = sender_email
    @text = text
    mail( to: to,
          subject: subject,
          reply_to: sender_email,
          from: sender )
  end

end
