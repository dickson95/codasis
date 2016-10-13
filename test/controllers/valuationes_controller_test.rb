require 'test_helper'

class ValuationesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @valuation = valuationes(:one)
  end

  test "should get index" do
    get valuationes_url
    assert_response :success
  end

  test "should get new" do
    get new_valuation_url
    assert_response :success
  end

  test "should create valuation" do
    assert_difference('Valuation.count') do
      post valuationes_url, params: { valuation: { good_max: @valuation.good_max, good_min: @valuation.good_min, image1: @valuation.image1, image2: @valuation.image2, image3: @valuation.image3, image4: @valuation.image4, level1: @valuation.level1, level2: @valuation.level2, level3: @valuation.level3, level3: @valuation.level3, low_max: @valuation.low_max, low_max: @valuation.low_max, low_min: @valuation.low_min, low_min: @valuation.low_min, vuln_max: @valuation.vuln_max, vuln_min: @valuation.vuln_min } }
    end

    assert_redirected_to valuation_path(Valuation.last)
  end

  test "should show valuation" do
    get valuation_url(@valuation)
    assert_response :success
  end

  test "should get edit" do
    get edit_valuation_url(@valuation)
    assert_response :success
  end

  test "should update valuation" do
    patch valuation_url(@valuation), params: { valuation: { good_max: @valuation.good_max, good_min: @valuation.good_min, image1: @valuation.image1, image2: @valuation.image2, image3: @valuation.image3, image4: @valuation.image4, level1: @valuation.level1, level2: @valuation.level2, level3: @valuation.level3, level3: @valuation.level3, low_max: @valuation.low_max, low_max: @valuation.low_max, low_min: @valuation.low_min, low_min: @valuation.low_min, vuln_max: @valuation.vuln_max, vuln_min: @valuation.vuln_min } }
    assert_redirected_to valuation_path(@valuation)
  end

  test "should destroy valuation" do
    assert_difference('Valuation.count', -1) do
      delete valuation_url(@valuation)
    end

    assert_redirected_to valuationes_path
  end
end
