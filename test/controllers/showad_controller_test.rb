require 'test_helper'

class ShowadControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get showad_show_url
    assert_response :success
  end

end
