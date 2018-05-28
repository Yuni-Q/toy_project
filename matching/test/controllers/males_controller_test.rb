require 'test_helper'

class MalesControllerTest < ActionController::TestCase
  setup do
    @male = males(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:males)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create male" do
    assert_difference('Male.count') do
      post :create, male: { birthday: @male.birthday, height: @male.height, hobbys: @male.hobbys, is_fulfilled: @male.is_fulfilled, job: @male.job, location: @male.location, name: @male.name }
    end

    assert_redirected_to male_path(assigns(:male))
  end

  test "should show male" do
    get :show, id: @male
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @male
    assert_response :success
  end

  test "should update male" do
    patch :update, id: @male, male: { birthday: @male.birthday, height: @male.height, hobbys: @male.hobbys, is_fulfilled: @male.is_fulfilled, job: @male.job, location: @male.location, name: @male.name }
    assert_redirected_to male_path(assigns(:male))
  end

  test "should destroy male" do
    assert_difference('Male.count', -1) do
      delete :destroy, id: @male
    end

    assert_redirected_to males_path
  end
end
