require 'test_helper'

class UnitesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @unit = unites(:one)
  end

  test "should get index" do
    get unites_url
    assert_response :success
  end

  test "should get new" do
    get new_unit_url
    assert_response :success
  end

  test "should create unit" do
    assert_difference('Unit.count') do
      post unites_url, params: { unit: { description: @unit.description, name: @unit.name } }
    end

    assert_redirected_to unit_path(Unit.last)
  end

  test "should show unit" do
    get unit_url(@unit)
    assert_response :success
  end

  test "should get edit" do
    get edit_unit_url(@unit)
    assert_response :success
  end

  test "should update unit" do
    patch unit_url(@unit), params: { unit: { description: @unit.description, name: @unit.name } }
    assert_redirected_to unit_path(@unit)
  end

  test "should destroy unit" do
    assert_difference('Unit.count', -1) do
      delete unit_url(@unit)
    end

    assert_redirected_to unites_path
  end
end
