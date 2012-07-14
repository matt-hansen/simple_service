require 'test_helper'

class NoiseControllerTest < ActionController::TestCase
  test "should say OK when pinged" do
    get :index, { 'q' => 'Ping' }
    assert_response :success
    assert_equal assigns(:text_to_render), "OK"
  end

  test "should correctly handle Expression 5 + 5 - 7 - 7" do
    get :index, { 'q' => 'Expression', 'd' => 'What is 5 + 5 - 7 - 7?' }
    assert_response :success
    assert_equal assigns(:text_to_render), (5+5-7-7)
  end

  test "should correctly handle 18 + 12 - 4 - 6 * 2" do
    get :index, { 'q' => 'Expression', 'd' => 'What is 18 + 12 - 4 - 6 * 2?' }
    assert_response :success
    assert_equal assigns(:text_to_render), (18+12-4-6*2)
  end

  test "should provide a github url when asked for the source" do
    get :index, { 'q' => 'Source' }
    assert_response :success
    assert_equal assigns(:text_to_render), "https://github.com/matt-hansen/simple_service"
  end
  
  test "should provide a default response when no params are passed" do
    get :index
    assert_response :success
    assert_equal assigns(:text_to_render), "You should hire me, I'm awesome!"
  end  
end
