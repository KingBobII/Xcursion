require "test_helper"

class InspirationsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get inspirations_new_url
    assert_response :success
  end

  test "should get create" do
    get inspirations_create_url
    assert_response :success
  end
end
