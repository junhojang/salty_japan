class Api::UserController < ApplicationController
  require_relative '../../managers/signup_manager'
  # json basic format {status:'true or false' ,msg:'message' ,data:{~~~~}}
  @status = false # default false
  @msg = '' #

  def chk_nickname
    if params[:nickname].present?
      if UserInfo.find_by nickname: params[:nickname]
        @msg = 'nickname was duplicated'
      else
        @status = true
        @msg = 'nickname was not duplicated'
      end
    else
      @msg = 'there is no nickname param'
    end
  end

  def signup_with_email
    @status, @msg, @data = SignupManager.chk_email_signup_params(params)
    @data = SignupManager.signup_with_email(params) if @status
  end

  def det_facebook_login_method
  end

  def signup_with_facebook
  end

  def signup
    case SignupManager.get_signup_type(params)
    when 1
      @status, @msg, @data  = SignupManager.chk_signup_params(params)
      SignupManager.signup_with_email(params) if @status == true
    when 2
     
      SignupManager.signup_with_f_email(params)
    when 3
      SignupManager.cross_signup_with_f_email(params)
    when 4
      SignupManager.cross_signup_with_email(params)
    end
  end
 
  def withdraw_from_member
    if params[:user_id].present?
      if @user = (User.find_by id: params[:user_id])
        if @user.is_active == 1
          @status = true
          @msg = 'success to withdraw from member'
        else
          @user = nil
          @msg = 'already withdrawn'
        end
      end
    else
      @msg = 'there is no user_id parameter'
    end
  end

  def login
    if params[:email].present? and params[:password].present?
      if @user = (User.find_by email: params[:email])
        if @user.authenticate(params[:password])
          @status = true
          @msg = 'success to login'
        else
          @msg = 'failed to authenticate'
        end
      else
        @msg = 'failed to find user by email'
      end
    else
      @msg = 'there are no email or password parameters'
    end
  end

  def set_log_user_login
    if params[:user_id].present?
      if @user = User.find_by_id(params[:user_id])
        @log = LogUserLogin.new
        @log.user_id = params[:user_id]
        @log.dsc = 'User : ' + @user.email + ' Logined '
        @log.save
        @status = true
        @msg = 'success to set log_user_login'
      else
        @msg = 'failed to find user by user_id'
      end
    else
      @msg = 'there is no user_id parameter'
    end
  end

  def get_user_info
    if params[:user_id].present?
      if @user = (UserInfo.find_by user_id: params[:user_id])
        @status = true
        @msg = 'success to get user_info'
      else
        @msg = 'failed to find user_info by user_id'
      end
    else
      @msg = 'there is no user_id parameter'
    end
  end

end
