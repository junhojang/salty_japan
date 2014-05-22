class Api::TestController < ApplicationController
  def get_level_test_words
    @status, @msg, @data = TestManager.get_level_test_words(params)
  end

  def set_log_test
    # @status, @msg, @data = TestManager.get_level_test_words(params)
  end
end
