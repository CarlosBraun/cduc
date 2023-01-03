require "application_system_test_case"

class JugadorsTest < ApplicationSystemTestCase
  setup do
    @jugador = jugadors(:one)
  end

  test "visiting the index" do
    visit jugadors_url
    assert_selector "h1", text: "Jugadors"
  end

  test "should create jugador" do
    visit jugadors_url
    click_on "New jugador"

    click_on "Create Jugador"

    assert_text "Jugador was successfully created"
    click_on "Back"
  end

  test "should update Jugador" do
    visit jugador_url(@jugador)
    click_on "Edit this jugador", match: :first

    click_on "Update Jugador"

    assert_text "Jugador was successfully updated"
    click_on "Back"
  end

  test "should destroy Jugador" do
    visit jugador_url(@jugador)
    click_on "Destroy this jugador", match: :first

    assert_text "Jugador was successfully destroyed"
  end
end
