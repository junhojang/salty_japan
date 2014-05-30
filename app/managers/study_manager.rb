class StudyManager

  def self.get_stage_info(params)
    user_stage_info = UserStageInfo.find_by user_id: params[:user_id]
    return true,MsgMaker.make_msg(MsgMaker.TYPE_SUCCESS,'get_stage_info'),my_word
  end

  def self.get_word_list(params)
    level = Level.where('category_id = ? and level_num = ?', params[:category], params[:level]).last
    stage = Stage.where('level_id =? and stage_num = ?', level.id, params[:stage]).last
    words = []
    if stage.stage_num == 0
      words = Word.where('stage_id = ?', stage.id)
    else
      b_words = Word.where('stage_id = ?', stage.id - 1).order("RANDOM()").take(3)
      
      b_words.each do |w|
        words.push(w)
      end

      a_words = Word.where('stage_id = ?', stage.id)
      a_words.each do |w|
        words.push(w)
      end
    end
    return true,MsgMaker.make_msg(MsgMaker.TYPE_SUCCESS,'get_word_list'),words
  end

  def self.set_my_word(params)
    my_word = MyWord.new
    my_word.user_id = params[:user_id]
    my_word.word_id = params[:word_id]
    my_word.save
    return true,MsgMaker.make_msg(MsgMaker.TYPE_SUCCESS,'set_my_word'),my_word
  end

  def self.get_my_word_list(params)
    words = []
    my_word = MyWord.where('user_id = ?',params[:user_id])
    my_word.each do |word|
      words.push(Word.find_by id: my_word.word_id)
    end
    return true,MsgMaker.make_msg(MsgMaker.TYPE_SUCCESS,'get_my_word_list'),data;
  end
end
