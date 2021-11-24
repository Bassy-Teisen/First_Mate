require "test_helper"

class GalleriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get galleries_index_url
    assert_response :success
  end

  test "should get new" do
    get galleries_new_url
    assert_response :success
  end

  test "should get create" do
    get galleries_create_url
    assert_response :success
  end

  test "should get show" do
    get galleries_show_url
    assert_response :success
  end

  test "should get edit" do
    get galleries_edit_url
    assert_response :success
  end

  test "should get update" do
    get galleries_update_url
    assert_response :success
  end

  test "should get destroy" do
    get galleries_destroy_url
    assert_response :success
  end
end
