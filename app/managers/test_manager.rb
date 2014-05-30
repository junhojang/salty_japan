class TestManager

  def self.get_level_test_words(params)
    level  = (Level.find_by category_id: 100)
    stage = (Stage.find_by level_id: @level.id)
    data = Word.where(stage_id: @stage.id).limit(20)
    status = true
    msg = ''
    return true,MsgMaker.make_msg(MsgMaker.TYPE_SUCCESS,'get_level_test_words'),data
  end

  def self.chk_level_test_available(params)
    level_test_log = LogTest.where('user_id = ? and test_type = 301',params[:user_id])
    if level_test_log.present?
      return false,'',nil
    else
      return true,MsgMaker.make_msg(MsgMaker.TYPE_SUCCESS,'chk_level_test_available'),nil
    end
  end

  def self.set_log_test(params)
    # developing update_user_stage_info
    if params[:test_type] == 302 or params[:test_type] == 303
      info = AppInfo.last
      if info.two_medal <= params[:score]
        @medal = 2
      elsif info.one_medal <= params[:score]
        @medal = 1
      else
        @medal = 0
      end
      cnt_test_log = LogTest.where('user_id = ? and test_type = ? and category = ? and stage = ? and level = ?',params[:user_id],params[:test_type],params[:category],params[:stage],params[:level]).count
      if cnt_test_log == 0
        @is_first = 1
        @reward = 20
        @point = 30
      else
        @is_first = 0
        @reward = 10
        @point = 15
      end  
    end
    return true,MsgMaker.make_msg(MsgMaker.TYPE_SUCCESS,'set_log_test'),LogManager.set_log_test(params[:user_id], params[:test_type], params[:category], params[:stage], params[:level], @medal, params[:score], @reward, @point, 'F', @is_first)
  end

  def self.update_user_stage_info(params)
    user_stage_info = UserStageInfo.find_by user_id: params[:user_id]
    user_stage_info.stage_info
  end

end
