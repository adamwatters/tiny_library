require 'test_helper'

def setup
  @base_title = "Tiny Library"
  @home_title = "Home | #{@base_title}"
end

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  test "should get root" do
    get root_url
    assert_response :success
    assert_select "title", @home_title
  end

  test "should get home" do
    get static_pages_home_url
    assert_response :success
    assert_select "title", @home_title
  end

end
