require "application_system_test_case"

class EnamesTest < ApplicationSystemTestCase
  setup do
    @ename = enames(:one)
  end

  test "visiting the index" do
    visit enames_url
    assert_selector "h1", text: "Enames"
  end

  test "should create ename" do
    visit enames_url
    click_on "New ename"

    click_on "Create Ename"

    assert_text "Ename was successfully created"
    click_on "Back"
  end

  test "should update Ename" do
    visit ename_url(@ename)
    click_on "Edit this ename", match: :first

    click_on "Update Ename"

    assert_text "Ename was successfully updated"
    click_on "Back"
  end

  test "should destroy Ename" do
    visit ename_url(@ename)
    click_on "Destroy this ename", match: :first

    assert_text "Ename was successfully destroyed"
  end
end
