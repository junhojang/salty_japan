class TestManager
  def self.get_level_test_words(params)
    level  = (Level.find_by category_id: 100)
    stage = (Stage.find_by level_id: @level.id)
    data = Word.where(stage_id: @stage.id).limit(20)
    status = true
    msg = ''
    return true,'',data
  end
end
