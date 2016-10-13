require 'test_helper'

class TypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @typ = types(:one)
  end

  test "should get index" do
    get types_url
    assert_response :success
  end

  test "should get new" do
    get new_typ_url
    assert_response :success
  end

  test "should create typ" do
    assert_difference('Type.count') do
      post types_url, params: { typ: { name: @typ.name } }
    end

    assert_redirected_to typ_path(Type.last)
  end

  test "should show typ" do
    get typ_url(@typ)
    assert_response :success
  end

  test "should get edit" do
    get edit_typ_url(@typ)
    assert_response :success
  end

  test "should update typ" do
    patch typ_url(@typ), params: { typ: { name: @typ.name } }
    assert_redirected_to typ_path(@typ)
  end

  test "should destroy typ" do
    assert_difference('Type.count', -1) do
      delete typ_url(@typ)
    end

    assert_redirected_to types_path
  end
end
