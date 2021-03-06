class StoreValidator
  require '../managers/msg_maker'

  def self.get_qpcon_list(params)
    if !params[:category_id].present?
      return false,MsgMaker.make_msg(MsgMaker::TYPE_FAILED,'get_qpcon_list',MsgMaker::LACK_OF_PARAMS),nil
    else
      return true,'',nil
    end
  end

  def self.order_qpcon_product(params)
  #
  end

  def self.request_to_exchange_reward(params)
    if !params[:user_id].present? or !params[:name].present? or !params[:bank_name].present? or !params[:account].present? or !params[:amount].present? or !params[:password].present?
      return false,MsgMaker.make_msg(MsgMaker::TYPE_FAILED,'request_to_exchange_reward',MsgMaker::LACK_OF_PARAMS),nil
    elsif !User.exist(id: params[:user_id])
      return false,MsgMaker.make_msg(MsgMaker::TYPE_FAILED,'request_to_exchange_reward',MsgMaker::NOT_EXIST,'user'),nil
    elsif params[:amount] > (LearningProgress.find_by user_id: params[:user_id]).current_reward
      return false,MsgMaker.make_msg(MsgMaker::TYPE_FAILED,'request_to_exchange_reward',MsgMaker::NOT_ENOUGH,'reward'),nil
    else
      return true,'',nil
    end
  end

end
