class EtcManager
  def self.get_help_list
    return true,'',BoardHelp.all
  end

  def self.get_notice_list
    return true,'',BoardNotice.all
  end

  def self.get_main_notice_list
    return true,'',BoardNotice.where('notice_type = 1')
  end

  def self.get_board_notice_list
    return true,'',BoardNotice.where('notice_type = 0')
  end

  def self.get_app_info
    return true,'',AppInfo.last
  end
  
  def self.get_prize_list
    return true,'',Prize.all
  end

  def self.attendance(params)
    progress = LearningProgress.find_by user_id: params[:user_id]
    before_at = progress.updated_at
    current_at = Date.today
    if current_at - before_at > 2
      progress.daily_test_cnt += 1
      progress.save
    end
  end

  def self.get_bank_list
    return true,'',BankList.all
  end

  def self.get_ment(params)
    return true,'',Ment.where('type = ?',params[:type])
  end
end
