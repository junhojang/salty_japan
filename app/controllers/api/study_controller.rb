class Api::StudyController < ApplicationController
  require_relative '../../managers/study_manager'
  require_relative '../../validators/study_validator'
  
  def set_my_word
    @status, @msg, @data = StudyValidator.set_my_word(params)
    @status, @msg, @data = StudyManager.set_my_word(params) if @status
  end

  def get_my_word_list
    @status, @msg, @data = StudyValidator.get_my_word_list(params)
    @status, @msg, @data = StudyManager.get_my_word_list(params) if @status
  end
end
