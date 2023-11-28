require "test_helper"

class ExcursionControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get excursion_index_url
    assert_response :success
  end

  test "should get show" do
    get excursion_show_url
    assert_response :success
  end

  test "should get new" do
    get excursion_new_url
    assert_response :success
  end

  test "should get create" do
    get excursion_create_url
    assert_response :success
  end

  test "should get edit" do
    get excursion_edit_url
    assert_response :success
  end

  test "should get update" do
    get excursion_update_url
    assert_response :success
  end

  test "should get destroy" do
    get excursion_destroy_url
    assert_response :success
  end

  test "should get like" do
    get excursion_like_url
    assert_response :success
  end

  test "should get dislike" do
    get excursion_dislike_url
    assert_response :success
  end
end
