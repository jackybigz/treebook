require 'test_helper'

class ProfilesControllerTest < ActionController::TestCase
  test "should get show" do
    get :show, id: users(:jack).profile_name
    assert_response :success    
    assert_template 'profiles/show'
  end

  test "Respond with page not found - 404" do
  	get :show, id: "Doesn't Exist"
  	assert_response :not_found
  end

  test "That variables are assigned on successful profile viewing" do
    get :show, id: users(:jack).profile_name
    assert assigns(:user)
    assert_not_empty assigns(:statuses)
  end

  test "only shows the corrent user's statuses" do
  	get:show, id: users(:jack).profile_name
  	assigns(:statuses).each do |status|
  		assert_equal users(:jack), status.user
 	end
 end	
end
