require 'test_helper'

class VisitorOnHomePageTest < ActionDispatch::IntegrationTest

  def test_a_visitor_on_ideabox_homepage_sees_correct_content
    visit '/'
    assert_equal root_path, current_path
    assert page.has_content?("Ideabox")
  end

end
