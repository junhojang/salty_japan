class StudyManager
  def self.set_my_word(params)
    my_word = MyWord.new
    my_word.user_id = params[:user_id]
    my_word.word_id = params[:word_id]
    my_word.save
    return true,'',my_word
  end

  def self.get_my_word_list(params)
    words = []
    my_word = MyWord.where('user_id = ?',params[:user_id])
    my_word.each do |word|
      words.push(Word.find_by id: my_word.word_id)
    end
    return true,'',data;
  end
end
