class UsersController < ApplicationController
  before_filter :set_user_by_reg_token

  def register_form
  end

  def finish_creating
    user_params = params.require(:user).permit(:password, :password_confirmation)
    if @user.update(user_params)
      @user.accept
      sign_in(@user)
      redirect_to root_path
    else
      redirect_to register_path(token: @user.reg_token), alert: (@user.errors.full_messages).join("<br/>").html_safe
    end
  end

  protected

    def set_user_by_reg_token
      sign_out(current_user) if current_user
      @user = User.where(reg_token: params[:token]).first
      return render :wrong_token unless @user.present?
    end

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end

end
