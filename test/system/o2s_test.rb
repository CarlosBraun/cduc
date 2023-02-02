require "application_system_test_case"

class O2sTest < ApplicationSystemTestCase
  setup do
    @o2 = o2s(:one)
  end

  test "visiting the index" do
    visit o2s_url
    assert_selector "h1", text: "O2s"
  end

  test "should create o2" do
    visit o2s_url
    click_on "New o2"

    click_on "Create O2"

    assert_text "O2 was successfully created"
    click_on "Back"
  end

  test "should update O2" do
    visit o2_url(@o2)
    click_on "Edit this o2", match: :first

    click_on "Update O2"

    assert_text "O2 was successfully updated"
    click_on "Back"
  end

  test "should destroy O2" do
    visit o2_url(@o2)
    click_on "Destroy this o2", match: :first

    assert_text "O2 was successfully destroyed"
  end
end
