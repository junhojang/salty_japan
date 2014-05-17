class Api::UserController < ApplicationController
  
  def signup
    if params[:email].present? and params[:password].present?
      @user = User.new
      @user.email = params[:email]
      @user.password = params[:password]
      @user.password_confirmnation = params[:password]
      @user.join_method = 1
      @user.is_active = 1
      @user.is_admin = 0
    elsif params[:f_email].present?
      @user = User.new
      @user.f_email = params[:f_email]
      @user.join_method = 2
      @user.is_active = 1
      @user.is_admin = 0
    end
  end

  def get_user_infos
    #user_infos + learning_progresses
  end

end
