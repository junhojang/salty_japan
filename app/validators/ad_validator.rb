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

end
