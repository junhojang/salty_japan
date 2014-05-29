class StudyValidator
  require '../managers/msg_maker'

  def self.set_my_word
    if params[:user_id].present? and params[:word_id].present?
      if !User.exist?(id: params[:user_id])
        return false,MsgMaker.make_msg(MsgMaker.TYPE_FAILED,'sey_my_word',MsgMaker.NOT_EXIST,'user'),nil
      elsif !Word.exist?(id: params[:word_id])
        return false,MsgMaker.make_msg(MsgMaker.TYPE_FAILED,'sey_my_word',MsgMaker.NOT_EXIST,'word'),nil
      else
        return true,'',nil
      end
    else
      return false,MsgMaker.make_msg(MsgMaker.TYPE_FAILED,'set_my_word',MsgMaker.LACK_OF_PARAMS),nil
    end
  end 

  def self.get_my_word_list
    if params[:user_id].present?
      return true,'',nil
    else
      return false,MsgMaker.make_msg(MsgMaker.TYPE_FAILED,'get_my_word',MsgMaker.LACK_OF_PARAMS),nil
    end
  end
end
