ActiveAdmin.register Project do

  permit_params :name, :site, :email, :phone, :email_on, :sms_on, :email_template, :sms_template, :last_sent, :sent_in_row, :email_sender_email, :email_sender, :email_subject
  
end
