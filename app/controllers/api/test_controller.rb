class Api::TestController < ApplicationController
  def get_level_test_words
    #100
    @level  = (Level.find_by category_id: 100)
    @stage = (Stage.find_by level_id: @level.id)
    @data = Word.where(stage_id: @stage.id).limit(20)
    @status = true
    @msg = ''
  end
end
