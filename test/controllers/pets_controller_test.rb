require 'test_helper'

class PetsControllerTest < ActionController::TestCase
  test "should get barnyard" do
    get :barnyard
    assert_response :success
  end

  test "should get bird" do
    get :bird
    assert_response :success
  end

  test "should get cat" do
    get :cat
    assert_response :success
  end

  test "should get dog" do
    get :dog
    assert_response :success
  end

  test "should get horse" do
    get :horse
    assert_response :success
  end

  test "should get pig" do
    get :pig
    assert_response :success
  end

  test "should get reptile" do
    get :reptile
    assert_response :success
  end

  test "should get smallfurry" do
    get :smallfurry
    assert_response :success
  end

  test "should get view" do
    get :view
    assert_response :success
  end

end
