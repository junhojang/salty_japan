class Api::UserController < ApplicationController
  require_relative '../../managers/signup_manager'
  require_relative '../../validators/signup_validator'
  # json basic format {status:'true or false' ,msg:'message' ,data:{~~~~}}
  
  # start signup process

  # 121 -> determine 122 or 123
  def chk_join_available
    @status, @msg, @data = UserValidator.chk_already_signed(params)
  end
  # 123 -> determine 126 or 127 , 145 -> determine 146 or 147
  def chk_nickname_available
    @status, @msg, @data  = UserValidator.chk_nickname(params)
  end
  # 123 -> determine 128 or 131 or 201 or 301
  def signup_with_email
    @status, @msg, @data = UserValidator.signup_with_email(params)
    @status, @msg, @data = UserManager.signup_with_email(params) if @status
  end
  # 142 -> determine 201 or 143 or 144 or 145
  def det_facebook_login_method
    @status, @msg, @data = UserValidator.det_facebook_login_method(params)
  end

  def cross_signup
    @status, @msg, @data = UserValidator.cross_signup(params)
    @status, @msg, @data = UserManager.cross_signup(params) if @status
  end
  # 145 -> determine 149 or 201
  def signup_with_facebook
    @status, @msg, @data = UserValidator.signup_with_facebook(params)
    @status, @msg, @data = UserManager.signup_with_facebook(params) if @status
  end
  # end signup process
 

  def withdraw_from_member
    @status, @msg, @data = UserValidator.withdraw_from_member(params)
    @status, @msg, @data = UserManager.withdraw_from_member(params) if @status
  end

  def login
    @status, @msg, @data = UserValidator.login(params)
    @status, @msg, @data = UserManager.login(params) if @status
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
