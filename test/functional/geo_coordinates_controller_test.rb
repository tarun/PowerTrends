require 'test_helper'

class GeoCoordinatesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:geo_coordinates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create geo_coordinate" do
    assert_difference('GeoCoordinate.count') do
      post :create, :geo_coordinate => { }
    end

    assert_redirected_to geo_coordinate_path(assigns(:geo_coordinate))
  end

  test "should show geo_coordinate" do
    get :show, :id => geo_coordinates(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => geo_coordinates(:one).to_param
    assert_response :success
  end

  test "should update geo_coordinate" do
    put :update, :id => geo_coordinates(:one).to_param, :geo_coordinate => { }
    assert_redirected_to geo_coordinate_path(assigns(:geo_coordinate))
  end

  test "should destroy geo_coordinate" do
    assert_difference('GeoCoordinate.count', -1) do
      delete :destroy, :id => geo_coordinates(:one).to_param
    end

    assert_redirected_to geo_coordinates_path
  end
end
