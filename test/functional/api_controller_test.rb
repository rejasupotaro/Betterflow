require 'test_helper'

class ApiControllerTest < ActionController::TestCase
  test "should get get_track_list" do
    get :get_track_list
    assert_response :success
  end

end
