class UserValidator
  require '../managers/msg_maker'

  def self.chk_join_available
    if !params[:ph].present?
      return false,MsgMaker.make_msg(MsgMaker::TYPE_FAILED,'chk_join_available',MsgMaker::LACK_OF_PARAMS),nil
    elsif !UserInfo.exists?(ph: params[:ph])
      return true,'',nil
    else
      return false,MsgMaker.make_msg(MsgMaker::TYPE_FAILED,'chk_join_available',MsgMaker::EXIST,'user'),nil
    end
  end

  def self.chk_nickname_available(params)
    if !params[:nickname].present?
      return false,MsgMaker.make_msg(MsgMaker::TYPE_FAILED,'chk_nickname_available',MsgMaker::LACK_OF_PARAMS),nil
    elsif !UserInfo.exists?(nickname: params[:nickname])
      return true,'',nil
    else 
      return false,MsgMaker.make_msg(MsgMaker::TYPE_FAILED,'chk_nickname_available',MsgMaker::EXIST,'nickanme'),nil
    end
  
  end

  def self.signup_with_email(params)
    #err_code: 0(lack of params) 128(email duplicate) 131(failed to find recommend nickname) 132(already registed ph)
    if !params[:email].present? or !params[:password].present?  or !params[:nickname].present? or !params[:sex].present? or !params[:age_group].present? or !params[:address].present? or !params[:ph].present?
      return false, 'failed to signup(ERR:0)',{err_code:0}
    elsif User.exists?(email: params[:email])
      return false, 'failed to signup(ERR:128)', {err_code:128}
    elsif params[:recommend].present? and !UserInfo.exists?(nickname: params[:recommend])
      return false, 'failed to signup(ERR:131)', {err_code:131}
    else
      return true, MsgMaker.make_msg(MsgMaker::TYPE_SUCCESS,'chk_email_signup_params'), nil
    end
  end

  def self.det_facebook_login_method(params)
    if !params[:ph].present? or !params[:f_email].present?
      return false,MsgMaker.make_msg(MsgMaker::TYPE_FAILED,'det_facebook_login_method',MsgMaker::LACK_OF_PARAMS),nil
    else
      p_user_info = UserInfo.find_by ph: params[:ph]
      p_user = User.find_by id: p_user_info.user_id if p_user_info.present? # find_uesr_by_ph
      f_user = User.find_by f_email: params[:f_email] # find_user_by_f_email
      if f_user.present?
        return true, 'login', {method:1} # 201
      elsif !f_uesr.present? and !p_user.present?
        return true, 'signup', {method:4} # 145
      elsif !f_user.present? and p_user.f_email.present?
        return true, 'wrong femail', {method:2} # 143
      elsif !f_user.present? and p_user.email.present?
        return true, 'cross signup', {method:3} # 144
      end
    end
  end
 
  def self.cross_signup(params)
    if !params[:ph].present? or !params[:f_email].present?
      return false,MsgMaker.make_msg(MsgMaker::TYPE_FAILED,'cross_signup',MsgMaker::LACK_OF_PARAMS),nil
    else
      return true,'',nil
    end
  end
  # i don't know .developing . . .
  def self.signup_with_facebook
    if !params[:f_email].present? or !params[:nickname].present? or !params[:f_address].present? or !params[:recommend].present?
      return false,MsgMaker.make_msg(MsgMaker::TYPE_FAILED,'signup_with_facebook',MsgMaker::LACK_OF_PARAMS),{err_code:0}
    elsif params[:recommend].present? and !UserInfo.exists?(nickname: params[:recommend])
      return false,MsgMaker.make_msg(MsgMaker::TYPE_FAILED,'signup_with_facebook',MsgMaker::LACK_OF_PARAMS),{err_code:149}
    else
      return true,'',nil
    end
  end

  def self.withdraw_from_member 
    if !params[:user_id].present?
      return false,MsgMaker.make_msg(MsgMaker::TYPE_FAILED,'withdraw_from_member',MsgMaker::LACK_OF_PARAMS),nil
    elsif user = (User.find_by id: params[:user_id])
      if user.is_active != 1 # isn't active
        return false,MsgMaker.make_msg(MsgMaker::TYPE_FAILED,'withdraw_from_member','alreay_inactive','user'),nil
      else
        return true,'',nil
      end
    else
      return false,MsgMaker.make_msg(MsgMaker::TYPE_FAILED,'withdraw_from_member',MsgMaker::NOT_EXIST,'user'),nil
    end
  end

  def self.login(params)
    if !params[:email].present? or !params[:password].present?
      return false,MsgMaker.make_msg(MsgMaker::TYPE_FAILED,'login',MsgMaker::LACK_OF_PARAMS),nil
    elsif user = (User.find_by email: params[:email])
      if !user.authenticate(params[:password])
        return false,MsgMaker.make_msg(MsgMaker::TYPE_FAILED,'login','authenticate','user'),nil
      elsif user.is_active != 1
        return false,MsgMaker.make_msg(MsgMaker::TYPE_FAILED,'login','isnt active'),nil
      else
        return true,'',nil
      end
    else
      return false,MsgMaker.make_msg(MsgMaker::TYPE_FAILED,'login',MsgMaker::NOT_EXIST,'user'),nil
    end
  end

  def self.get_user_info(params)
    if !params[:user_id].present?
      return false,MsgMaker.make_msg(MsgMaker::TYPE_FAILED,'get_user_info',MsgMaker::LACK_OF_PARAMS),nil
    elsif !UserInfo.exists?(user_id: params[:user_id])
      return false,MsgMaker.make_msg(MsgMaker::TYPE_FAILED,'get_user_info',MsgMaker::NOT_EXIST,'UserInfo'),user
    else
      return true,'',nil
    end
  end

  def self.get_learning_progress(params)
    if !params[:user_id].present?
      return false,MsgMaker.make_msg(MsgMaker::TYPE_FAILED,'get_learning_progress',MsgMaker::LACK_OF_PARAMS),nil
    elsif !LearningProgress.exist?(user_id: params[:uesr_id])
      return false,MsgMaker.make_msg(MsgMaker::TYPE_FAILED,'get_learning_progress',MsgMaker::NOT_EXIST,'LearningProgress'),nil
    else
      return true,'',nil
    end
  end

  def self.set_user_password(params)
    if !params[:user_id].present? or !params[:password].present?
      return false,MsgMaker.make_msg(MsgMaker::TYPE_FAILED,'set_user_password',MsgMaker::LACK_OF_PARAMS),nil
    elsif !User.exists?(id: params[:user_id])
      return false,MsgMaker.make_msg(MsgMaker::TYPE_FAILED,'set_user_password',MsgMaker::NOT_EXIST,'User'),nil
    else
      return true,'',nil
    end
  end

  def self.change_user_password(params)
    if !params[:user_id].present? or !params[:password].present? or !params[:new_password].present?
      return false,MsgMaker.make_msg(MsgMaker::TYPE_FAILED,'change_user_password',MsgMaker::LACK_OF_PARAMS),nil
    elsif user = User.find_by id: params[:user_id]
      if !user.authenticate(params[:password])
          return false,MsgMaker.make_msg(MsgMaker::TYPE_FAILED,'change_user_password','authenticate','user'),nil
      else
          return true,'',nil
      end
    else
      return false,MsgMaker.make_msg(MsgMaker::TYPE_FAILED,'change_user_password',MsgMaker::NOT_EXIST,'user'),nil
    end
    
  end

  def self.change_user_character(params)
    if !params[:user_id].present? or !params[:character].present?
      return false,MsgMaker.make_msg(MsgMaker::TYPE_FAILED,'change_user_character',MsgMaker::LACK_OF_PARAMS),nil
    elsif !User.exists?(id: params[:user_id])
      return false,MsgMaker.make_msg(MsgMaker::TYPE_FAILED,'change_user_character',MsgMaker::NOT_EXIST,'user'),nil
    else
      return true,'',nil
    end
  end

end
