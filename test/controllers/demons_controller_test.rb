require "test_helper"

class DemonsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get demons_index_url
    assert_response :success
  end

  test "should get show" do
    get demons_show_url
    assert_response :success
  end

  test "should get new" do
    get demons_new_url
    assert_response :success
  end
end
