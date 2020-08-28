require 'test_helper'

class WarehousesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get warehouses_show_url
    assert_response :success
  end

end
