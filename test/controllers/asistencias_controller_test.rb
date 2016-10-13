require 'test_helper'

class AsistenciasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @asistencia = asistencias(:one)
  end

  test "should get index" do
    get asistencias_url
    assert_response :success
  end

  test "should get new" do
    get new_asistencia_url
    assert_response :success
  end

  test "should create asistencia" do
    assert_difference('Asistencia.count') do
      post asistencias_url, params: { asistencia: { ciudad: @asistencia.ciudad, evento_id: @asistencia.evento_id, fecha: @asistencia.fecha, objetivo: @asistencia.objetivo, persona_id: @asistencia.persona_id } }
    end

    assert_redirected_to asistencia_path(Asistencia.last)
  end

  test "should show asistencia" do
    get asistencia_url(@asistencia)
    assert_response :success
  end

  test "should get edit" do
    get edit_asistencia_url(@asistencia)
    assert_response :success
  end

  test "should update asistencia" do
    patch asistencia_url(@asistencia), params: { asistencia: { ciudad: @asistencia.ciudad, evento_id: @asistencia.evento_id, fecha: @asistencia.fecha, objetivo: @asistencia.objetivo, persona_id: @asistencia.persona_id } }
    assert_redirected_to asistencia_path(@asistencia)
  end

  test "should destroy asistencia" do
    assert_difference('Asistencia.count', -1) do
      delete asistencia_url(@asistencia)
    end

    assert_redirected_to asistencias_path
  end
end
