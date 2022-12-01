require "application_system_test_case"

class SupportExecutivesTest < ApplicationSystemTestCase
  setup do
    @support_executive = support_executives(:one)
  end

  test "visiting the index" do
    visit support_executives_url
    assert_selector "h1", text: "Support executives"
  end

  test "should create support executive" do
    visit support_executives_url
    click_on "New support executive"

    click_on "Create Support executive"

    assert_text "Support executive was successfully created"
    click_on "Back"
  end

  test "should update Support executive" do
    visit support_executive_url(@support_executive)
    click_on "Edit this support executive", match: :first

    click_on "Update Support executive"

    assert_text "Support executive was successfully updated"
    click_on "Back"
  end

  test "should destroy Support executive" do
    visit support_executive_url(@support_executive)
    click_on "Destroy this support executive", match: :first

    assert_text "Support executive was successfully destroyed"
  end
end
