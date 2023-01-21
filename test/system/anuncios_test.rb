require "application_system_test_case"

class AnunciosTest < ApplicationSystemTestCase
  setup do
    @anuncio = anuncios(:one)
  end

  test "visiting the index" do
    visit anuncios_url
    assert_selector "h1", text: "Anuncios"
  end

  test "should create anuncio" do
    visit anuncios_url
    click_on "New anuncio"

    fill_in "Categoria", with: @anuncio.categoria
    fill_in "Description", with: @anuncio.description
    fill_in "Remitente", with: @anuncio.remitente
    fill_in "Title", with: @anuncio.title
    click_on "Create Anuncio"

    assert_text "Anuncio was successfully created"
    click_on "Back"
  end

  test "should update Anuncio" do
    visit anuncio_url(@anuncio)
    click_on "Edit this anuncio", match: :first

    fill_in "Categoria", with: @anuncio.categoria
    fill_in "Description", with: @anuncio.description
    fill_in "Remitente", with: @anuncio.remitente
    fill_in "Title", with: @anuncio.title
    click_on "Update Anuncio"

    assert_text "Anuncio was successfully updated"
    click_on "Back"
  end

  test "should destroy Anuncio" do
    visit anuncio_url(@anuncio)
    click_on "Destroy this anuncio", match: :first

    assert_text "Anuncio was successfully destroyed"
  end
end
