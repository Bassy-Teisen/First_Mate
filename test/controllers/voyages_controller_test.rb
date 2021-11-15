require "test_helper"

class VoyagesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get voyages_index_url
    assert_response :success
  end

  test "should get new" do
    get voyages_new_url
    assert_response :success
  end

  test "should get create" do
    get voyages_create_url
    assert_response :success
  end

  test "should get show" do
    get voyages_show_url
    assert_response :success
  end

  test "should get edit" do
    get voyages_edit_url
    assert_response :success
  end

  test "should get update" do
    get voyages_update_url
    assert_response :success
  end

  test "should get destroy" do
    get voyages_destroy_url
    assert_response :success
  end
end
