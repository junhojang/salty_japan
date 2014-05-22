class Api::UserController < ApplicationController
  require_relative '../../managers/signup_manager'
  require_relative '../../validators/signup_validator'
  # json basic format {status:'true or false' ,msg:'message' ,data:{~~~~}}
  
  # start signup process
  def chk_nickname
    @status, @msg, @data  = UserValidator.chk_nickname(params)
  end

  def signup_with_email
    @status, @msg, @data = UserValidator.chk_email_signup_params(params)
    @status, @msg, @data = UserManager.signup_with_email(params) if @status
  end

  def det_facebook_login_method
    @status, @msg, @data = UserValidator.det_facebook_login_method(params)
  end

  def cross_signup
    @status, @msg, @data = UserValidator.cross_signup(params)
    @status, @msg, @data = UserManager.cross_signup(params) if @status
  end

  def signup_with_facebook
    @status, @msg, @data = UserValidator.signup_with_facebook(params)
    @status, @msg, @data = UserManager.signup_with_facebook(params) if @status
  end
  # end signup process
 

  def withdraw_from_member
    @status, @msg, @data = UserValidator.withdraw_from_member(params)
    @status, @msg, @data = UserManager.withdraw_from_member(@data) if @status
  end

  def login
    @status, @msg, @data = UserValidator.login(params)
    @status, @msg, @data = LogManager.set_log_user_login(@data.id,'') if @status
  end

  def get_user_info
    @status, @msg, @data = UserValidator.get_user_info(params)
    @status, @msg, @data = UserManager.get_user_info(params) if @status
  end

  def get_learning_progress
    @status, @msg, @data = UserValidator.get_learning_progress(params)
    @status, @msg, @data = UserManager.get_learning_progress(params) if @status
  end

  # set
  
  def set_user_password
    @status, @msg, @data = UserValidator.set_user_password(params)
    @status, @msg, @data = UserManager.set_user_password(params) if @status
  end
 
  def change_user_password
    @status, @msg, @data = UserValidator.change_user_password(params)
    @status, @msg, @data = UserManager.change_user_password(params) if @status
  end

  def change_user_character
    @status, @msg, @data = UserValidator.change_user_character(params)
    @status, @msg, @data = UserManager.change_user_character(params) if @status
  end

end
