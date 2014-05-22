class StoreManager

  def self.get_qpcon_list(params)
    return true,'',QpconProduct.where('category_id = ?',params[:category_id])
  end

  def self.order_qpcon_product(params)
  # 
  end

  def self.request_to_exchange_reward
    exchange = Exchange.new
    exchange.user_id = params[:user_id]
    exchange.name = params[:name]
    exchange.bank = params[:bank]
    exchange.account = params[:account]
    exchange.process_status = 0
    exchange.amount = params[:amount]
    exchange.save
    
    return true,'',exchange
  end
end
