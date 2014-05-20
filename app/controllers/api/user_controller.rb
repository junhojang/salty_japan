class Api::UserController < ApplicationController
  require_relative '../../managers/signup_manager'
  require_relative '../../validators/signup_validator'
  # json basic format {status:'true or false' ,msg:'message' ,data:{~~~~}}
  
  # start signup process
  def chk_nickname
    @status, @msg, @data  = SignupValidator.chk_nickname(params)
  end

  def signup_with_email
    @status, @msg, @data = SignupValidator.chk_email_signup_params(params)
    @data = SignupManager.signup_with_email(params) if @status
  end

  def det_facebook_login_method
    @status, @msg, @data = SignupValidator.det_facebook_login_method(params)
  end

  def cross_signup
    @status, @msg, @data = SignupValidator.cross_signup(params)
    @data = SignupManager.cross_signup(params) if @status
  end

  def signup_with_facebook
    @status, @msg, @data = SignupValidator.signup_with_facebook(params)
    @data = SignupManager.signup_with_facebook(params) if @status
  end
  # end signup process
 


  def withdraw_from_member
    @status, @msg, @data = Validator.withdraw_from_member(params)
    if @status
      @data.is_active == 0
      @data.save 
    end
  end

  def login
    @status, @msg, @data = Validator.login(params)
    LogManager.set_log_user_login(@data.id,'') if @status
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
