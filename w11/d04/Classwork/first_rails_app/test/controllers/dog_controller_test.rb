require 'test_helper'

class DogControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
