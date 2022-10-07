require "test_helper"

class Admin::PerfecturesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_perfectures_index_url
    assert_response :success
  end
end
