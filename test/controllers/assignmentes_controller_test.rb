require 'test_helper'

class AssignmentesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @assignment = assignmentes(:one)
  end

  test "should get index" do
    get assignmentes_url
    assert_response :success
  end

  test "should get new" do
    get new_assignment_url
    assert_response :success
  end

  test "should create assignment" do
    assert_difference('Assignment.count') do
      post assignmentes_url, params: { assignment: { role_id: @assignment.role_id, user_id: @assignment.user_id } }
    end

    assert_redirected_to assignment_path(Assignment.last)
  end

  test "should show assignment" do
    get assignment_url(@assignment)
    assert_response :success
  end

  test "should get edit" do
    get edit_assignment_url(@assignment)
    assert_response :success
  end

  test "should update assignment" do
    patch assignment_url(@assignment), params: { assignment: { role_id: @assignment.role_id, user_id: @assignment.user_id } }
    assert_redirected_to assignment_path(@assignment)
  end

  test "should destroy assignment" do
    assert_difference('Assignment.count', -1) do
      delete assignment_url(@assignment)
    end

    assert_redirected_to assignmentes_path
  end
end
