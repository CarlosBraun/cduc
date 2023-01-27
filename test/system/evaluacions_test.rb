require "application_system_test_case"

class EvaluacionsTest < ApplicationSystemTestCase
  setup do
    @evaluacion = evaluacions(:one)
  end

  test "visiting the index" do
    visit evaluacions_url
    assert_selector "h1", text: "Evaluacions"
  end

  test "should create evaluacion" do
    visit evaluacions_url
    click_on "New evaluacion"

    click_on "Create Evaluacion"

    assert_text "Evaluacion was successfully created"
    click_on "Back"
  end

  test "should update Evaluacion" do
    visit evaluacion_url(@evaluacion)
    click_on "Edit this evaluacion", match: :first

    click_on "Update Evaluacion"

    assert_text "Evaluacion was successfully updated"
    click_on "Back"
  end

  test "should destroy Evaluacion" do
    visit evaluacion_url(@evaluacion)
    click_on "Destroy this evaluacion", match: :first

    assert_text "Evaluacion was successfully destroyed"
  end
end
