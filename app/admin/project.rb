ActiveAdmin.register Project do

  permit_params :name, :site, :email, :phone, :email_on, :sms_on, :email_template, :sms_template, :last_sent, :sent_in_row, :email_sender_email, :email_sender, :email_subject, :sms_from, :bitrix_on, :bitrix_url, :bitrix_login, :bitrix_password, :bitrix_title_template, :bitrix_comment_template, :bitrix_params_template
  
end
