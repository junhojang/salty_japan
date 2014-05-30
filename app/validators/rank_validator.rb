class RankValidator
  require '../managers/msg_maker'

  def self.get_my_rank(params)
    if !params[:user_id].present? or !params[:category].present?
      return false,MsgMaker.make_msg(MsgMaker::TYPE_FAILED,'get_my_rank',MsgMaker::LACK_OF_PARAMS),nil
    elsif !User.exists?(id: params[:user_id])
      return false,MsgMaker.make_msg(MsgMaker::TYPE_FAILED,'get_my_rank',MsgMaker::NOT_EXIST,'user'),nil
    else
      return true,'',nil
    end
  end

  def self.get_rank_list(params)
    if !params[:category].present?
      return false,MsgMaker.make_msg(MsgMaker::TYPE_FAILED,'get_rank_list',MsgMaker::LACK_OF_PARAMS),nil
    else
      return true,'',nil
    end
  end

end
