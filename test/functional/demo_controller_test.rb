require 'test_helper'

class DemoControllerTest < ActionController::TestCase
  include Crowd::UserAttributeKeys

  def setup
    Crowd.crowd_url = 'http://127.0.0.1:8095/crowd/services/SecurityServer'
    Crowd.crowd_app_name = 'soaptest'
    Crowd.crowd_app_pword = 'soaptest'
    Crowd.authenticate_application
    Crowd.add_principal('unittest','unittest','unit test user', true, { 'mail' => 'unittest@unittest.com', FIRSTNAME => 'Unit', LASTNAME => 'Test' })
  end
  
  def teardown 
     Crowd.remove_principal('unittest')
  end  

  test "requires authentication" do
    get :index
    assert_response 401  # 'unauthorized'
  end
  
  test "accepts authentication via user name and password" do
    set_credentials("unittest:unittest")
    get :index
    assert_response :success
  end
  
  test "authenticates the user via SSO token without requiring login" do
    @request.cookies[Crowd.crowd_cookie_tokenkey] = Crowd.authenticate_principal('unittest', 'unittest', { 'remote_address' => '0:0:0:0:0:0:0:1%0' })
    get :index
    assert_response :success
  end

  test "doesn't require authentication after login" do
    set_credentials("unittest:unittest")
    get :index
    assert_response :success

    set_credentials(":")
    get :index
    assert_response :success
  end
    
  test "requires authentication after log out" do
    set_credentials("unittest:unittest")
    get :index
    assert_response :success

    get :log_out
    assert_response :success

    set_credentials(":")
    get :index
    assert_response 401
  end
  
  def set_credentials(credentials)
    @request.env["HTTP_AUTHORIZATION"] = "Basic " + Base64::encode64(credentials)
  end
end
