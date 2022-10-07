require "test_helper"

class User::PerfecturesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get user_perfectures_show_url
    assert_response :success
  end
end
