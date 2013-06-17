require 'test_helper'

class BrunchFindersControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get get_address" do
    get :get_address
    assert_response :success
  end

  test "should get search" do
    get :search
    assert_response :success
  end

  test "should get results" do
    get :results
    assert_response :success
  end

  test "should get topspots" do
    get :topspots
    assert_response :success
  end

  test "should get coups" do
    get :coups
    assert_response :success
  end

end
