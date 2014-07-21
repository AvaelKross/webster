# == Schema Information
#
# Table name: projects
#
#  id                 :integer          not null, primary key
#  name               :string(255)
#  site               :string(255)
#  email              :string(255)
#  phone              :string(255)
#  email_on           :boolean
#  sms_on             :boolean
#  email_template     :text
#  sms_template       :text
#  last_sent          :datetime
#  sent_in_row        :integer
#  created_at         :datetime
#  updated_at         :datetime
#  email_sender_email :string(255)
#  email_sender       :string(255)
#  email_subject      :string(255)
#  sms_from           :string(255)
#

class Project < ActiveRecord::Base
  has_many :messages

  def send_sms(sms_text)
    Smsru::Sender.sms_send(self.phone, sms_text, Settings.sms_api_id, self.sms_from)
    Message.create(project: self, text: sms_text, message_type: "sms")
  end
  handle_asynchronously :send_sms

  def send_email(email_text)
    UserMailer.custom_mail(self.email, self.email_sender_email, "#{self.email_sender} <#{self.email_sender_email}>", self.email_subject, email_text).deliver
    Message.create(project: self, text: email_text, message_type: "e-mail")
  end
  handle_asynchronously :send_email
end
