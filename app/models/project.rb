# == Schema Information
#
# Table name: projects
#
#  id                      :integer          not null, primary key
#  name                    :string(255)
#  site                    :string(255)
#  email                   :string(255)
#  phone                   :string(255)
#  email_on                :boolean
#  sms_on                  :boolean
#  email_template          :text
#  sms_template            :text
#  last_sent               :datetime
#  sent_in_row             :integer
#  created_at              :datetime
#  updated_at              :datetime
#  email_sender_email      :string(255)
#  email_sender            :string(255)
#  email_subject           :string(255)
#  sms_from                :string(255)
#  bitrix_on               :boolean
#  bitrix_url              :string(255)
#  bitrix_login            :string(255)
#  bitrix_password         :string(255)
#  bitrix_title_template   :string(255)
#  bitrix_comment_template :string(255)
#  bitrix_params_template  :string(255)
#

require 'net/http'
require 'json'

class Project < ActiveRecord::Base

  has_many :messages

  def create_lead(params)
    additional_params = {}
    bitrix_params = JSON.parse self.bitrix_params_template
    bitrix_params.each{|k,v| additional_params[k]=params[v.to_sym] if params[v.to_sym]}

    title = self.bitrix_title_template.gsub(/\{(.*?)\}/) {"#{params[$1.to_sym]}"}
    comment = self.bitrix_comment_template.gsub(/\{(.*?)\}/) {"#{params[$1.to_sym]}"}

    uri = URI("#{self.bitrix_url}crm/configs/import/lead.php")
    params_to_be_sent = { LOGIN: "#{self.bitrix_login}", 
               PASSWORD: "#{self.bitrix_password}", 
               TITLE: "#{title}",
               SOURCE_ID: "#{self.site}",
               NAME: "#{params[:name]}",
               COMMENTS: "#{params[:comment]}",
               PHONE_OTHER: "#{params[:phone]}",
               EMAIL_OTHER: "#{params[:email]}"}.merge(additional_params)
    uri.query = URI.encode_www_form(params_to_be_sent)
    response = Net::HTTP.get(uri)
  end
  handle_asynchronously :create_lead

end
