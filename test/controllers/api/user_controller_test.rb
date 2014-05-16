require 'test_helper'

class Api::UserControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
