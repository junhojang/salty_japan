class StudyValidator
  require '../managers/msg_maker'

  def self.set_my_word
    if !params[:user_id].present? or !params[:word_id].present?
      return false,MsgMaker.make_msg(MsgMaker::TYPE_FAILED,'set_my_word',MsgMaker::LACK_OF_PARAMS),nil
    elsif !User.exist?(id: params[:user_id])
      return false,MsgMaker.make_msg(MsgMaker::TYPE_FAILED,'sey_my_word',MsgMaker::NOT_EXIST,'user'),nil
    elsif !Word.exist?(id: params[:word_id])
      return false,MsgMaker.make_msg(MsgMaker::TYPE_FAILED,'sey_my_word',MsgMaker::NOT_EXIST,'word'),nil
    else
      return true,'',nil
    end
  end 

  def self.get_my_word_list
    if !params[:user_id].present?
      return false,MsgMaker.make_msg(MsgMaker::TYPE_FAILED,'get_my_word',MsgMaker::LACK_OF_PARAMS),nil
    else
      return true,'',nil
    end
  end
end
