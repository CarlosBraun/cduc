require "test_helper"

class EnamesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ename = enames(:one)
  end

  test "should get index" do
    get enames_url
    assert_response :success
  end

  test "should get new" do
    get new_ename_url
    assert_response :success
  end

  test "should create ename" do
    assert_difference("Ename.count") do
      post enames_url, params: { ename: {  } }
    end

    assert_redirected_to ename_url(Ename.last)
  end

  test "should show ename" do
    get ename_url(@ename)
    assert_response :success
  end

  test "should get edit" do
    get edit_ename_url(@ename)
    assert_response :success
  end

  test "should update ename" do
    patch ename_url(@ename), params: { ename: {  } }
    assert_redirected_to ename_url(@ename)
  end

  test "should destroy ename" do
    assert_difference("Ename.count", -1) do
      delete ename_url(@ename)
    end

    assert_redirected_to enames_url
  end
end
