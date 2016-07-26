require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @base_title = "Tiny Library"
  end

  test "should get root" do
    get root_url
    assert_response :success
    assert_select "title", @base_title
  end

  test "should get home" do
    get static_pages_home_url
    assert_response :success
    assert_select "title", @base_title
  end

end
