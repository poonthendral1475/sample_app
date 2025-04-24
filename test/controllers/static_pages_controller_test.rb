require "test_helper"

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @base_title = "Ruby on Rails Tutorial for Sample App"
  end
  def assert_static_pages(url)
    get url
    assert_response :success
  end

  test "should get root" do
    get root_url
    assert_response :success
  end

  test "should get home" do
    assert_static_pages(static_pages_home_url)
    assert_select "title" , "Home | #{@base_title}"
  end

  test "should get help" do
    assert_static_pages(static_pages_help_url)
    assert_select "title" , "Help | #{@base_title}"
  end

  test "should get about" do
    assert_static_pages(static_pages_about_url)
    assert_select "title" , "About | #{@base_title}"
  end

  test "should get contact" do
    get static_pages_contact_url
    assert_response :success
  end
end
