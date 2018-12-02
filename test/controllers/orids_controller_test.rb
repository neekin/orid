require 'test_helper'

class OridsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @orid = orids(:one)
  end

  test "should get index" do
    get orids_url
    assert_response :success
  end

  test "should get new" do
    get new_orid_url
    assert_response :success
  end

  test "should create orid" do
    assert_difference('Orid.count') do
      post orids_url, params: { orid: { d: @orid.d, i: @orid.i, o: @orid.o, r: @orid.r, user_id: @orid.user_id } }
    end

    assert_redirected_to orid_url(Orid.last)
  end

  test "should show orid" do
    get orid_url(@orid)
    assert_response :success
  end

  test "should get edit" do
    get edit_orid_url(@orid)
    assert_response :success
  end

  test "should update orid" do
    patch orid_url(@orid), params: { orid: { d: @orid.d, i: @orid.i, o: @orid.o, r: @orid.r, user_id: @orid.user_id } }
    assert_redirected_to orid_url(@orid)
  end

  test "should destroy orid" do
    assert_difference('Orid.count', -1) do
      delete orid_url(@orid)
    end

    assert_redirected_to orids_url
  end
end
