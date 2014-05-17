class Api::UserController < ApplicationController
  @status = false
  def signup
    if params[:email].present? and params[:password].present?
      if !User.find_by email: params[:email] 
        @user = User.new
        @user.email = params[:email]
        @user.password = params[:password]
        @user.password_confirmation = params[:password]
        @user.join_method = 1
        @user.is_active = 1
        @user.is_admin = 0
        @user.save
      end
    elsif params[:f_email].present?
      if !User.find_by f_email: params[:f_email]
        @user = User.new
        @user.f_email = params[:f_email]
        @user.join_method = 2
        @user.is_active = 1
        @user.is_admin = 0
        @user.save
      end
    end
  end
 
  def login
    if params[:email].present? and params[:password].present?
      if @user = User.find_by email: params[:email]
        if @user.authenticate(params[:password])
          @status = true
        end
      end 
    end
  end

  def set_log_user_login
    if params[:user_id].present?
      if @user = User.find_by_id(params[:user_id])
         @log = LogUserLogin.new
         @log.user_id = params[:user_id]
         @log.dsc = 'User : ' + @user.email + ' Logined '
         @log.save
      end
    end
  end

  def get_user_infos
    #user_infos + learning_progresses
  end

end
