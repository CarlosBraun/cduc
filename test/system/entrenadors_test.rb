require "application_system_test_case"

class EntrenadorsTest < ApplicationSystemTestCase
  setup do
    @entrenador = entrenadors(:one)
  end

  test "visiting the index" do
    visit entrenadors_url
    assert_selector "h1", text: "Entrenadors"
  end

  test "should create entrenador" do
    visit entrenadors_url
    click_on "New entrenador"

    click_on "Create Entrenador"

    assert_text "Entrenador was successfully created"
    click_on "Back"
  end

  test "should update Entrenador" do
    visit entrenador_url(@entrenador)
    click_on "Edit this entrenador", match: :first

    click_on "Update Entrenador"

    assert_text "Entrenador was successfully updated"
    click_on "Back"
  end

  test "should destroy Entrenador" do
    visit entrenador_url(@entrenador)
    click_on "Destroy this entrenador", match: :first

    assert_text "Entrenador was successfully destroyed"
  end
end
