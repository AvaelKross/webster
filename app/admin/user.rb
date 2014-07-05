ActiveAdmin.register User do

  permit_params :email, :accepted

  show do
    panel :details do
      attributes_table_for user do
        row :email
        row :accepted
      end
    end
  end

  index download_links: false do
    column :id
    column :email
    column :accepted

    actions defaults: true
  end

  form do |f|  
    f.inputs "User" do
      f.input :email
      f.input :accepted
    end   
    f.actions
  end

  form do |f|
    f.inputs "User" do
      f.input :email
      f.actions
    end
  end

  controller do
    def create
      if User.where(email: permitted_params[:user][:email]).empty?
        user = User.new(permitted_params[:user])
        user.save(validate: false)
        UserMailer.welcome_mail(user).deliver
      else
        return redirect_to new_admin_user_path, notice: "Email already in use"
      end

      redirect_to admin_users_path
    end
  end
end
