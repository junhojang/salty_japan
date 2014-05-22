class StoreValidator

  def self.get_qpcon_list(params)
    if params[:category_id].present?
      return true,'',nil
    else
      return false,'',nil
    end
  end

  def self.order_qpcon_product(params)
  #
  end

  def self.request_to_exchange_reward(params)
    if params[:user_id].present? and params[:name].present? and params[:bank_name].present? and params[:account].present? and params[:amount].present? and params[:password].present?
      if User.exist(id: params[:user_id]) and params[:amount] <= (LearningProgress.find_by user_id: params[:user_id]).current_reward
        return true,'',nil
      else
        return false,'',nil
    else
      return false,'',nil
    end
  end
end
