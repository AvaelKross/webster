ActiveAdmin.register Project do

  permit_params :name, :site, :email, :phone, :email_on, :sms_on, :email_template, :sms_template, :email_sender_email, :email_sender, :email_subject, :sms_from, :bitrix_on, :bitrix_url, :bitrix_login, :bitrix_password, :bitrix_title_template, :bitrix_comment_template, :bitrix_params_template, :bitrix_assigned_id, :plain_site
  
  form do |f|
    f.semantic_errors
    f.inputs 'Main info' do
      f.input :name
      f.input :site
      f.input :plain_site
    end
    f.inputs 'SMS' do
      f.input :sms_on
      f.input :phone
      f.input :sms_template
      f.input :sms_from
    end
    f.inputs 'Emails' do
      f.input :email_on
      f.input :email
      f.input :email_subject
      f.input :email_sender
      f.input :email_sender_email
      f.input :email_template
    end
    f.inputs 'Bitrix24' do
      f.input :bitrix_on
      f.input :bitrix_url
      f.input :bitrix_login
      f.input :bitrix_password, as: :string
      f.input :bitrix_title_template
      f.input :bitrix_comment_template
      f.input :bitrix_params_template
      f.input :bitrix_assigned_id
    end
    f.actions
  end

end
