require "test_helper"

class O2sControllerTest < ActionDispatch::IntegrationTest
  setup do
    @o2 = o2s(:one)
  end

  test "should get index" do
    get o2s_url
    assert_response :success
  end

  test "should get new" do
    get new_o2_url
    assert_response :success
  end

  test "should create o2" do
    assert_difference("O2.count") do
      post o2s_url, params: { o2: {  } }
    end

    assert_redirected_to o2_url(O2.last)
  end

  test "should show o2" do
    get o2_url(@o2)
    assert_response :success
  end

  test "should get edit" do
    get edit_o2_url(@o2)
    assert_response :success
  end

  test "should update o2" do
    patch o2_url(@o2), params: { o2: {  } }
    assert_redirected_to o2_url(@o2)
  end

  test "should destroy o2" do
    assert_difference("O2.count", -1) do
      delete o2_url(@o2)
    end

    assert_redirected_to o2s_url
  end
end
