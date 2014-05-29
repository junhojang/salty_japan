class EtcValidator
  require '../managers/msg_maker'

  def self.get_help_list
    if BoardHelp.count != 0
      return true,'',nil
    else
      return false,MsgMaker.make_msg(MsgMaker.TYPE_FAILED,'get_help_list',MsgMaker.NOT_EXIST,'board_help datas'),nil
    end
  end

  def self.get_notice_list
    if BoardNotice.count != 0
      return true,'',nil
    else
      return false,MsgMaker.make_msg(MsgMaker.TYPE_FAILED,'get_notice_list',MsgMaker.NOT_EXIST,'board_notice datas'),nil
    end
  end

  def self.get_main_notice_list
    if BoardNotice.where('notice_type = 1').count != 0
      return true,'',nil
    else
      return false,MsgMaker.make_msg(MsgMaker.TYPE_FAILED,'get_main_notice_list',MsgMaker.NOT_EXIST,'notice_type = 1 board_notice datas'),nil 
    end
  end

  def self.get_board_notice_list
    if BoardNotice.where('notice_type = 0').count != 0
      return true,'',nil
    else
      return false,MsgMaker.make_msg(MsgMaker.TYPE_FAILED,'get_board_notice_list',MsgMaker.NOT_EXIST,'notice_type = 0 board_notice datas'),nil
    end
  end

  def self.get_app_info
    if AppInfo.count != 0
      return true,'',nil
    else
      return false,MsgMaker.make_msg(MsgMaker.TYPE_FAILED,'get_app_info',MsgMaker.NOT_EXIST,'app_info'),nil
    end
  end  

  def self.get_prize_list
    if Prize.count != 0
      return true,'',nil
    else
      return false,MsgMaker.make_msg(MsgMaker.TYPE_FAILED,'get_prize_list',MsgMaker.NOT_EXIST,'prize datas'),nil
    end
  end

  def self.attendance
    if params[:user_id].present?
      if !User.exists?(id: params[:user_id])
        return false,MsgMaker.make_msg(MsgMaker.TYPE_FAILED,'attendance',MsgMaker.NOT_EXIST,'user'),nil
      else
        return true,'',nil
      end
    else
      return false,MsgMaker.make_msg(MsgMaker.TYPE_FAILED,'attendance',MsgMaker.LACK_OF_PARAMS),nil
    end
  end

  def self.get_ment(params)
    if params[:type].present?
      return true,'',nil
    else
      return false,MsgMaker.make_msg(MsgMaker.TYPE_FAILED,'ment',MsgMaker.LACK_OF_PARAMS),nil
    end
  end

end
