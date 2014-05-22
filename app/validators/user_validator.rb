class UserValidator

  def self.det_facebook_login_method(params)
    if params[:ph].present? and params[:f_email].present?
      @p_user_info = UserInfo.find_by ph: params[:ph]
      @p_user = User.find_by id: @p_user_info.user_id if @p_user_info.present?
      @f_user = User.find_by f_email: params[:f_email]
      if @f_user.present?
        return true, 'login', {method:1}
      elsif !@f_uesr.present? and !@p_user.present?
        return true, 'signup', {method:4}
      elsif !@f_user.present? and @p_user.f_email.present?
        return true, 'wrong femail', {method:2}
      elsif !@f_user.present? and @p_user.email.present?
        return true, 'cross signup', {method:3}
      end
    else
      return false
    end
  end

  def self.chk_email_signup_params(params)
    #err_code: 0(lack of params) 128(email duplicate) 131(failed to find recommend nickname) 132(already registed ph)
    if !params[:email].present? or !params[:password].present?  or !params[:nickname].present? or !params[:sex].present? or !params[:age_group].present? or !params[:address].present? or !params[:ph].present?
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

  def self.chk_nickname(params)
    if params[:nickname].present?
      if UserInfo.exists?(nickname: params[:nickname])
        return false,'',nil
      else 
        return true,'',nil
      end
    else
      return false,'',nil
    end
  end

  def self.cross_signup(params)
    if params[:ph].present? and params[:f_email].present?
      return true,'',nil
    else
      return false,'',nil
    end
  end

  def self.signup_with_facebook
    if !params[:f_email].present? or !params[:nickname].present? or !params[:f_address].present? or !params[:recommend].present?
      return false,'',{err_code:0}
    elsif params[:recommend].present? and !UserInfo.exists?(nickname: params[:recommend])
      return false,'',{err_code:149}
    else
      return true,'',nil
    end
  end

  def self.withdraw_from_member
    if params[:user_id].present?
      if @user = (User.find_by id: params[:user_id])
        if @user.is_active == 1
          return true,'',@user
        else
          return false,'',nil
        return
      else
        return false,'',nil
      end
    else
      return false,'',nil
    end
  end

  def self.login(params)
    if params[:email].present? and params[:password].present?
      if @user = (User.find_by email: params[:email])
        if @user.authenticate(params[:password])
          return true,'',nil
        else
          return false,'',nil
        end
      else
        return false,'',nil
      end
    else
      return false,'',nil
    end
  end

  def self.get_user_info(params)
    if params[:user_id].present?
      if UserInfo.exists?(user_id: params[:user_id])
        return true,'',user
      else
        return false,'',nil
      end
    else
      return false,'',nil
    end
  end

  def self.get_learning_progress(params)
    if params[:user_id].present?
      if LearningProgress.exist?(user_id: params[:uesr_id])
        return true,'',nil
      else
        return false,'',nil
      end
    else
      return false,'',nil
    end
  end

  def self.set_user_password(params)
    if params[:user_id].present? and params[:password].present?
      if User.exists?(id: params[:user_id])
        return true,'',nil
      else
        return false,'',nil
      end
    else
      return false,'',nil
    end
  end

  def self.change_user_password(params)
    if params[:user_id].present? and params[:password].present? and params[:new_password].present?
      user = User.find_by id: params[:user_id]
      if user.present?
        if user.authenticate(params[:password])
          return true,'',nil
        else
          return false,'',nil
        end
      else
        return false,'',nil
      end
    else
      return false,'',nil
    end
  end

  def self.change_user_character(params)
    if params[:user_id].present? and params[:character].present?
      if User.exists?(id: params[:user_id])
        return true,'',nil
      else
        return false,'',nil
      end
    else
      return false,'',nil
    end
  end

end
