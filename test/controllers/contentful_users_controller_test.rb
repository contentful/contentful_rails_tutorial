require 'test_helper'

class ContentfulUsersControllerTest < ActionController::TestCase
  setup do
    @contentful_user = contentful_users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:contentful_users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create contentful_user" do
    assert_difference('ContentfulUser.count') do
      post :create, contentful_user: { access_token: @contentful_user.access_token, content_type: @contentful_user.content_type, name: @contentful_user.name, space_id: @contentful_user.space_id }
    end

    assert_redirected_to contentful_user_path(assigns(:contentful_user))
  end

  test "should show contentful_user" do
    get :show, id: @contentful_user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @contentful_user
    assert_response :success
  end

  test "should update contentful_user" do
    patch :update, id: @contentful_user, contentful_user: { access_token: @contentful_user.access_token, content_type: @contentful_user.content_type, name: @contentful_user.name, space_id: @contentful_user.space_id }
    assert_redirected_to contentful_user_path(assigns(:contentful_user))
  end

  test "should destroy contentful_user" do
    assert_difference('ContentfulUser.count', -1) do
      delete :destroy, id: @contentful_user
    end

    assert_redirected_to contentful_users_path
  end
end
