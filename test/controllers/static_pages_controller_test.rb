require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get inicio" do
    get static_pages_inicio_url
    assert_response :success
  end

end
