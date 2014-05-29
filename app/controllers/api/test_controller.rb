class Api::TestController < ApplicationController
  def chk_level_test_available
    @status, @msg, @data = TestValidator.chk_level_test_available(params)
    @status, @msg, @data = TestManager.chk_level_test_available(params) if @status
  end

  def get_level_test_words
    @status, @msg, @data = TestManager.get_level_test_words(params)
  end

  def set_log_test
    @status, @msg, @data = TestValidator.set_log_test(params)
    @status, @msg, @data = TestManager.set_log_test(params) if @status
    # @status, @msg, @data = TestManager.get_level_test_words(params)
  end
end
