class SignupManager
  require_relative 'log_manager'
  def self.det_facebook_login_method(params)
    if params[:ph].present? and params[:f_email].present?
      @p_user_info = UserInfo.find_by ph: params[:ph]
      @p_user = User.find_by id: @p_user_info.user_id if @p_user_info.present?
      @f_user = User.find_by f_email: params[:f_email] 
      if @f_user.present?
        return status:true, msg:'login', data:{method:1}
      elsif !@f_uesr.present? and !@p_user.present?
        return status:true, msg:'signup', data:{method:4}
      elsif !@f_user.present? and @p_user.f_email.present?
        return status:true, msg:'wrong femail', data:{method:2}
      elsif !@f_user.present? and @p_user.email.present?
        return status:true, msg:'cross signup', data:{method:3}
      end
    else
      return status:false
    end
  end

  def self.chk_email_signup_params(params)
    #err_code: 0(lack of params) 128(email duplicate) 131(failed to find recommend nickname) 132(already registed ph)
    if !params[:nickname].present? or !params[:sex].present? or !params[:age_group].present? or !params[:address].present? or !params[:ph].present?
      return false, 'failed to signup(ERR:0)',{err_code:0}
    elsif User.exists?(email: params[:email])
      return false, 'failed to signup(ERR:128)', {err_code:128}
    elsif params[:recommend].present? and !UserInfo.exists?(nickname: params[:recommend])
      return false, 'failed to signup(ERR:131)', {err_code:131}
    elsif UserInfo.exists?(ph: params[:ph])
      return false, 'failed to signup(ERR:132)', {err_code:132}
    else
      return true, nil, nil
    end
  end
  
  def self.signup_with_email(params)
    @user = User.new
    @user.email = params[:email]
    @user.password = params[:password]
    @user.password_confirmation = params[:password]
    @user.join_method = 1
    @user.is_active = 1
    @user.is_admin = 0
    @user.save

    @user_info = UserInfo.new
    @user_info.user_id = @user.id
    @user_info.nickname = params[:nickname]
    @user_info.sex = params[:sex]
    @user_info.age_group = params[:age_group]
    @user_info.address = params[:address]
    @user_info.ph = params[:ph]
    if params[:recommend].present? and UserInfo.exists?(nickname: params[:nickname])
      @user_info.recommend = params[:recommend]
      LogManager.set_log_reward(@user.id,2002,30,'Signup Recommend reward')        
    end
    @user_info.save
    LogManager.set_log_signup(@user.id,1,'Sucess to signup with email')
    return @user
  end

end
