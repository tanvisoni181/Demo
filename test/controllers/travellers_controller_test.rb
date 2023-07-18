require "test_helper"

class TravellersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get travellers_index_url
    assert_response :success
  end
end
