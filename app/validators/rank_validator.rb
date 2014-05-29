class RankValidator
  require '../managers/msg_maker'

  def self.get_my_rank(params)
    if params[:user_id].present? and params[:category].present?
      if !User.exists?(id: params[:user_id])
        return false,MsgMaker.make_msg(MsgMaker.TYPE_FAILED,'get_my_rank',MsgMaker.NOT_EXIST,'user'),nil
      else
        return true,'',nil
      end
    else
      return false,MsgMaker.make_msg(MsgMaker.TYPE_FAILED,'get_my_rank',MsgMaker.LACK_OF_PARAMS),nil
    end
  end

  def self.get_rank_list(params)
    if params[:category].present?
      return true,'',nil
    else
      return false,MsgMaker.make_msg(MsgMaker.TYPE_FAILED,'get_rank_list',MsgMaker.LACK_OF_PARAMS),nil
    end
  else
end
