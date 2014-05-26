class AdValidator
  def self.get_ad(params)
    if params[:user_id].present? and User.exist?(id: params[:user_id])
      return true,'',''
    else
      return false,'',''
    end
  end

  def self.get_ad_list(params)
    if params[:user_id].present? and User.exist?(id: params[:user_id])
      return true,'',''
    else
      return false,'',''
    end
  end

  def self.get_my_coupon_list(params)
    if params[:user_id].present?
      if User.exists?(id: params[:user_id])
        return true,'',nil
      else
        return false,'',nil
      end
    else
      return false,'',nil
    end
  end

  def self.set_cpd_log
  end

  def self.set_cpdm_log
  end

  def self.set_cpdx
  end


end
