require "application_system_test_case"

class LoginTest < ApplicationSystemTestCase
  setup do
    @login = login(:one)
  end

  test "visiting the index" do
    visit login_url
    assert_selector "h1", text: "Login"
  end

  test "should create login" do
    visit login_url
    click_on "New login"

    click_on "Create Login"

    assert_text "Login was successfully created"
    click_on "Back"
  end

  test "should update Login" do
    visit login_url(@login)
    click_on "Edit this login", match: :first

    click_on "Update Login"

    assert_text "Login was successfully updated"
    click_on "Back"
  end

  test "should destroy Login" do
    visit login_url(@login)
    click_on "Destroy this login", match: :first

    assert_text "Login was successfully destroyed"
  end
end
