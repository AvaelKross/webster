ActiveAdmin.register_page "Settings" do

  menu priority: 1, label: "Settings"

  content title: "SETTINGS" do

    columns do
      column do
        panel "Main settings" do
          render partial: 'main_settings'
        end
      end

      column do
        panel "Mailer settings" do
          render partial: 'mailer_settings'
        end
      end
    end
  end

  page_action :update, method: :put do
    settings_params = params.require(:settings).permit( :host, 
                                                        :mailer_username, 
                                                        :mailer_password, 
                                                        :mailer_host, 
                                                        :mailer_port )
    p settings_params
    settings_params.each do |param|
      Settings[param[0]] = param[1] if param[1].present?
    end
    Rails.application.reload_routes! if settings_params[:start_page_controller].present?
    redirect_to admin_settings_path, notice: "Settings have been saved!"
  end

end
