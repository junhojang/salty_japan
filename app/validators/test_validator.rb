class TestValidator
  require '../managers/msg_maker'

  def self.chk_level_test_available(params)
    # test_type 301 == level test
    if params[:user_id].present?
      if !User.exists?(id: params[:user_id])
        return true,'',nil
      elsif LogTest.where('user_id = ? and test_type = 301',params[:user_id]).count > 0
        return false,MsgMaker.make_msg(MsgMaker.TYPE_FAILED,'chk_level_test_available',MsgMaker.EXIST,'level_test_log')
      else
        return false,MsgMaker.make_msg(MsgMaker.TYPE_FAILED,'chk_level_test_available',MsgMaker.EXIST,'user'),nil
      end
    else
      return false,MsgMaker.make_msg(MsgMaker.TYPE_FAILED,'chk_level_test_available',MsgMaker.LACK_OF_PARAMS),nil
    end
  end

  def self.set_log_test(params)
    if params[:test_type].present? and params[:user_id].present?
      if !User.exists?(id: params[:user_id])
        return false,MsgMaker.make_msg(MsgMaker.TYPE_FAILED,'set_log_test',MsgMaker.NOT_EXIST,'user'),nil
      elsif params[:test_type] == 301 # level_test
        if params[:score].present?
          return true,'',nil
        else
          return false,MsgMaker.make_msg(MsgMaker.TYPE_FAILED,'set_log_test',MsgMaker.LACK_OF_PARAMS),nil
        end
      elsif params[:test_type] == 302 or params[:test_type] == 303 # normal test and special test
        if params[:category].present? and params[:stage].present? and params[:level].present? and params[:score].present?
          return true,'',nil
      else # test type != 301 or 302 or 303
        return false,MsgMaker.make_msg(MsgMaker.TYPE_FAILED,'set_log_test'),nil
      end
    else
      return false,MsgMaker.make_msg(MsgMaker.TYPE_FAILED,'set_log_test',MsgMaker.LACK_OF_PARAMS),nil
    end 
  end
end
