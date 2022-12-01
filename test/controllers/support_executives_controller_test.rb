require "test_helper"

class SupportExecutivesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @support_executive = support_executives(:one)
  end

  test "should get index" do
    get support_executives_url
    assert_response :success
  end

  test "should get new" do
    get new_support_executive_url
    assert_response :success
  end

  test "should create support_executive" do
    assert_difference("SupportExecutive.count") do
      post support_executives_url, params: { support_executive: {  } }
    end

    assert_redirected_to support_executive_url(SupportExecutive.last)
  end

  test "should show support_executive" do
    get support_executive_url(@support_executive)
    assert_response :success
  end

  test "should get edit" do
    get edit_support_executive_url(@support_executive)
    assert_response :success
  end

  test "should update support_executive" do
    patch support_executive_url(@support_executive), params: { support_executive: {  } }
    assert_redirected_to support_executive_url(@support_executive)
  end

  test "should destroy support_executive" do
    assert_difference("SupportExecutive.count", -1) do
      delete support_executive_url(@support_executive)
    end

    assert_redirected_to support_executives_url
  end
end
