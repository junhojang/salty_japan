class StudyValidator
  def self.set_my_word
    if params[:user_id].present? and params[:word_id].present?
      if User.exist?(id: params[:user_id]) and Word.exist?(id: params[:word_id])
        return true,'',nil
      else
        return false,'',nil
      end
    else
      return false,'',nil
    end
  end 

  def self.get_my_word_list
    if params[:user_id].present?
      return true,'',nil
    else
      return false,'',nil
    end
  end
end
