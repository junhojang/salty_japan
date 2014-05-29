class RankManager

  def self.get_my_rank(params)
    model = nil
    case(params[:category])
    when 1
      model = RankingWeekA
    when 2
      model = RankingWeekB
    when 3
      model = RankingWeekC
    when 4
      model = RankingWeekD
    end
    return true,MsgMaker.make_msg(MsgMaker.TYPE_SUCCESS,'get_my_rank'),model.find_by(user_id: params[:user_id])
  end

  def self.get_rank_list(params)
    model = nil
    case(params[:category])
    when 1
      model = RankingWeekA
    when 2
      model = RankingWeekB
    when 3
      model = RankingWeekC
    when 4
      model = RankingWeekD
    end
    return true,MsgMaker.make_msg(MsgMaker.TYPE_SUCCESS,'get_rank_list'),model.all
  end
end
