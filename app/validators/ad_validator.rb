class AdValidator
  require '../managers/msg_maker'

  def self.get_ad(params)
    if !params[:user_id].present? 
      return false,MsgMaker.make_msg(MsgMaker::TYPE_FAILED,'get_ad',MsgMaker::LACK_OF_PARAMS),nil
    elsif !User.exists?(id: params[:user_id])
      return false,MsgMaker.make_msg(MsgMaker::TYPE_FAILED,'get_ad',MsgMaker::NOT_EXIST,'user'),nil
    else
      return true,'',nil
    end
  end

  def self.get_ad_list(params)
    if !params[:user_id].present?
      return false,MsgMaker.make_msg(MsgMaker::TYPE_FAILED,'get_ad_list',MsgMaker::LACK_OF_PARAMS),nil
    elsif !User.exists?(id: params[:user_id])
      return false,MsgMaker.make_msg(MsgMaker::TYPE_FAILED,'get_ad_list',MsgMaker::NOT_EXIST,'user'),nil
    else
      return true,'',nil
    end
  end

  def self.get_my_coupon_list(params)
    if !params[:user_id].present?
      return false,MsgMaker.make_msg(MsgMaker::TYPE_FAILED,'get_my_coupon_list',MsgMaker::LACK_OF_PARAMS),nil
    if !User.exists?(id: params[:user_id])
      return false,MsgMaker.make_msg(MsgMaker::TYPE_FAILED,'get_my_coupon_list',MsgMaker::NOT_EXIST,'user'),nil
    else
      return true,'',nil
    end
  end

  def self.set_cpd_log(params)
    if !params[:user_id].present? or !params[:ad_id].present? or !params[:act].present?
      return false,MsgMaker.make_msg(MsgMaker::TYPE_FAILED,'set_cpd_log',MsgMaker::LACK_OF_PARAMS),nil
    elsif !User.exists?(id: params[:user_id])
      return false,MsgMaker.make_msg(MsgMaker::TYPE_FAILED,'set_cpd_log',MsgMaker::NOT_EXIST,'user'),nil
    elsif !Advertisement.exists?(ad_id: params[:ad_id])
      return false,MsgMaker.make_msg(MsgMaker::TYPE_FAILED,'set_cpd_log',MsgMaker::NOT_EXIST,'advertisement'),nil
    else
      return true,'',nil
    end
  end

  def self.set_cpdm_log(params)
    if !params[:user_id].present? or !params[:ad_id].present? or !params[:act].present? or !params[:view_time].present?
      return false,MsgMaker.make_msg(MsgMaker::TYPE_FAILED,'set_cpdm_log',MsgMaker::LACK_OF_PARAMS),nil
    elsif !User.exists?(id: params[:user_id])
      return false,MsgMaker.make_msg(MsgMaker::TYPE_FAILED,'set_cpdm_log',MsgMaker::NOT_EXIST,'user'),nil
    elsif !Advertisement.exists?(ad_id: params[:ad_id])
      return false,MsgMaker.make_msg(MsgMaker::TYPE_FAILED,'set_cpdm_log',MsgMaker::NOT_EXIST,'advertisement'),nil
    else
      return true,'',nil
    end
  end

  def self.set_cpx_log(params)
    if !params[:user_id].present? or !params[:ad_id].present? or !params[:act].present?
      return false,MsgMaker.make_msg(MsgMaker::TYPE_FAILED,'set_cpx_log',MsgMaker::LACK_OF_PARAMS),nil
    elsif !User.exists?(id: params[:user_id])
      return false,MsgMaker.make_msg(MsgMaker::TYPE_FAILED,'set_cpx_log',MsgMaker::NOT_EXIST,'user'),nil
    elsif !Advertisement.exists?(ad_id: params[:ad_id])
      return false,MsgMaker.make_msg(MsgMaker::TYPE_FAILED,'set_cpx_log',MsgMaker::NOT_EXIST,'advertisement'),nil
    else
      return true,'',nil
    end
  end

  def self.get_survey(params)
    if !params[:cpx_id].present?
      return false,MsgMaker.make_msg(MsgMaker::TYPE_FAILED,'get_survey',MsgMaker::LACK_OF_PARAMS),nil
    elsif !AdvertisementCpx.exists?(id: params[:cpx_id]
      return false,MsgMaker.make_msg(MsgMaker::TYPE_FAILED,'get_survey',MsgMaker::NOT_EXIST,'user'),nil
    elsif !Survey.exists?(cpx_id: params[:cpx_id])
      return false,MsgMaker.make_msg(MsgMaker::TYPE_FAILED,'gey_survey',MsgMaker::NOT_EXIST,'survey'),nil
    else
      return true,'',nil
    end
  end
  
  def self.set_survey_result(params)
    if !params[:user_id].present? or !params[:survey_id].present? or !params[:result].present?
      return false,MsgMaker.make_msg(MsgMaker::TYPE_FAILED,'set_survey_result',MsgMaker::LACK_OF_PARAMS),nil
    elsif !User.exists?(id: params[:user_id])
      return false,MsgMaker.make_msg(MsgMaker::TYPE_FAILED,'set_survey_result',MsgMaker::NOT_EXIST,'user'),nil
    elsif !Survey.exists?(id: params[:survey_id])
      return false,MsgMaker.make_msg(MsgMaker::TYPE_FAILED,'set_survey_result',MsgMaker::NOT_EXIST,'survey'),nil
    else
      return true,'',nil
    end
  end

end
