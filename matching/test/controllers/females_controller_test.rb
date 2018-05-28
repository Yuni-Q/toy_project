require 'test_helper'

class FemalesControllerTest < ActionController::TestCase
  setup do
    @female = females(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:females)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create female" do
    assert_difference('Female.count') do
      post :create, female: { birthday: @female.birthday, height: @female.height, hobbys: @female.hobbys, job: @female.job, location: @female.location, name: @female.name }
    end

    assert_redirected_to female_path(assigns(:female))
  end

  test "should show female" do
    get :show, id: @female
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @female
    assert_response :success
  end

  test "should update female" do
    patch :update, id: @female, female: { birthday: @female.birthday, height: @female.height, hobbys: @female.hobbys, job: @female.job, location: @female.location, name: @female.name }
    assert_redirected_to female_path(assigns(:female))
  end

  test "should destroy female" do
    assert_difference('Female.count', -1) do
      delete :destroy, id: @female
    end

    assert_redirected_to females_path
  end
end
