require "test_helper"

class EntrenadorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @entrenador = entrenadors(:one)
  end

  test "should get index" do
    get entrenadors_url
    assert_response :success
  end

  test "should get new" do
    get new_entrenador_url
    assert_response :success
  end

  test "should create entrenador" do
    assert_difference("Entrenador.count") do
      post entrenadors_url, params: { entrenador: {  } }
    end

    assert_redirected_to entrenador_url(Entrenador.last)
  end

  test "should show entrenador" do
    get entrenador_url(@entrenador)
    assert_response :success
  end

  test "should get edit" do
    get edit_entrenador_url(@entrenador)
    assert_response :success
  end

  test "should update entrenador" do
    patch entrenador_url(@entrenador), params: { entrenador: {  } }
    assert_redirected_to entrenador_url(@entrenador)
  end

  test "should destroy entrenador" do
    assert_difference("Entrenador.count", -1) do
      delete entrenador_url(@entrenador)
    end

    assert_redirected_to entrenadors_url
  end
end
