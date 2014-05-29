class EtcManager
  def self.get_help_list
    return true,MsgMaker.make_msg(MsgMaker.TYPE_SUCCESS,'get_help_list'),BoardHelp.all
  end

  def self.get_notice_list
    return true,MsgMaker.make_msg(MsgMaker.TYPE_SUCCESS,'get_notice_list'),BoardNotice.all
  end

  def self.get_main_notice_list
    return true,MsgMaker.make_msg(MsgMaker.TYPE_SUCCESS,'get_main_notice_list'),BoardNotice.where('notice_type = 1')
  end

  def self.get_board_notice_list
    return true,MsgMaker.make_msg(MsgMaker.TYPE_SUCCESS,'get_board_notice_list'),BoardNotice.where('notice_type = 0')
  end

  def self.get_app_info
    return true,MsgMaker.make_msg(MsgMaker.TYPE_SUCCESS,'get_app_info'),AppInfo.last
  end
  
  def self.get_prize_list
    return true,MsgMaker.make_msg(MsgMaker.TYPE_SUCCESS,'get_prize_list'),Prize.all
  end

  def self.attendance(params)
    progress = LearningProgress.find_by user_id: params[:user_id]
    before_at = progress.updated_at
    current_at = Date.today
    if current_at - before_at > 2
      progress.daily_test_cnt += 1
      progress.save
    end
    return true,MsgMaker.make_msg(MsgMaker.TYPE_SUCCESS,'attendance'),progress
  end

  def self.get_bank_list
    return true,MsgMaker.make_msg(MsgMaker.TYPE_SUCCESS,'get_bank_list'),BankList.all
  end

  def self.get_ment(params)
    return true,MsgMaker.make_msg(MsgMaker.TYPE_SUCCESS,'get_ment'),Ment.where('type = ?',params[:type])
  end
end
