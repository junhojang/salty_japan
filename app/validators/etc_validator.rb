class EtcValidator

  def self.get_help_list
    if BoardHelp.count != 0
      return true,'',nil
    else
      return false,'',nil
    end
  end

  def self.get_notice_list
    if BoardNotice.count != 0
      return true,'',nil
    else
      return false,'',nil
    end
  end

  def self.get_main_notice_list
    if BoardNotice.where('notice_type = 1').count != 0
      return true,'',nil
    else
      return false,'',nil 
    end
  end

  def self.get_board_notice_list
    if BoardNotice.where('notice_type = 0').count != 0
      return true,'',nil
    else
      return false,'',nil
    end
  end

  def self.get_app_info
    if AppInfo.count != 0
      return true,'',nil
    else
      return false,'',nil
    end
  end  

  def self.get_prize_list
    if Prize.count != 0
      return true,'',nil
    else
      return false,'',nil
    end
  end

  def self.attendance
    if params[:user_id].present?
      if params[:user_id].exists?(id: params[:user_id])
        return true,'',nil
      else
        return false,'',nil
      end
    else
      return false,'',nil
    end
  end

  def self.get_ment(params)
    if params[:type].present?
      return true,'',nil
    else
      return false,'',nil
    end
  end

end
