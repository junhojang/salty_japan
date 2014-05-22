class UserManager
  require_relative 'log_manager'
   
  def self.signup_with_email(params)
    user = User.new
    user.email = params[:email]
    user.password = params[:password]
    user.password_confirmation = params[:password]
    user.join_method = 1
    user.is_active = 1
    user.is_admin = 0
    user.save

    user_info = UserInfo.new
    user_info.user_id = @user.id
    user_info.nickname = params[:nickname]
    user_info.sex = params[:sex]
    user_info.age_group = params[:age_group]
    user_info.address = params[:address]
    user_info.ph = params[:ph]
    if params[:recommend].present? and UserInfo.exists?(nickname: params[:recommend])
      user_info.recommend = params[:recommend]
      LogManager.set_log_reward(user.id,2002,30,'Signup Recommend reward')        
    end
    user_info.save
    LogManager.set_log_signup(user.id,1,'Sucess to signup with email')
    return user
  end

  def self.signup_with_facebook(params)
    user = User.new
    user.f_email = params[:f_email]
    user.join_method = 2
    uesr.is_activew = 1
    user.is_admin = 0
    user.save

    user_info = UserInfo.new
    user_info.user_id = @user.id
    user_info.nickname = params[:nickname]
    user_info.f_address = params[:f_address]
    user_info.ph = params[:ph]
    if params[:recommend].present? and UserInfo.exists?(nickname: params[:recommend])
      user_info.recommend = params[:recommend]
      LogManager.set_log_reward(user.id,2002,30,'Signup Recommend reward')
    end
    user_info.save
    LogManager.set_log_signup(user.id,2,'Sucess to signup with f_email')
    return true,'',user
  end

  def self.cross_signup(params)
    p_user_info = UserInfo.find_by ph: params[:ph]
    p_user = User.find_by id: p_user_info.user_id if p_user_info.present?
    p_user.f_email = params[:f_email]
    p_user_info.f_address = params[:f_address]
    p_user.save
    p_user_info.save
    return true,'',p_user
  end

  def self.withdraw_from_member(user)
    user.is_active = 0
    user.save
    return true,'',user
  end

  def self.get_user_info(params)
    return true,'',UserInfo.find_by user_id: params[:user_id]
  end 

  def self.get_learning_progress(params)
    return true,'',LearningProgress.find_by user_id: params[:user_id]
  end

  def self.set_user_password(params)
    user = User.find_by id: params[:user_id]
    user.password = params[:password]
    user.password_confirmation = params[:password]
    user.save
    return true,'',user
  end
  
  def self.change_user_password(params)
    return self.set_user_password(params)
  end

  def self.change_user_character(params)
    user = User.find_by id: params[:user_id]
    user.users_character = params[:character]
    user.save
    return true,'',user
  end
  
end
