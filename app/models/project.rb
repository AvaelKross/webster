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
end
