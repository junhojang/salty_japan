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
end
