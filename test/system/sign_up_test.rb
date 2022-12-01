require "application_system_test_case"

class SignUpTest < ApplicationSystemTestCase
  setup do
    @sign_up = sign_up(:one)
  end

  test "visiting the index" do
    visit sign_up_url
    assert_selector "h1", text: "Sign ups"
  end

  test "should create sign up" do
    visit sign_up_url
    click_on "New sign up"

    click_on "Create Sign up"

    assert_text "Sign up was successfully created"
    click_on "Back"
  end

  test "should update Sign up" do
    visit sign_up_url(@sign_up)
    click_on "Edit this sign up", match: :first

    click_on "Update Sign up"

    assert_text "Sign up was successfully updated"
    click_on "Back"
  end

  test "should destroy Sign up" do
    visit sign_up_url(@sign_up)
    click_on "Destroy this sign up", match: :first

    assert_text "Sign up was successfully destroyed"
  end
end
