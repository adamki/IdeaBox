require 'test_helper'

class UserCanAddAnIdeaWithACategoryTest<ActionDispatch::IntegrationTest

  test 'an idea can be added to a category' do
    idea = Idea.create(name: "Scuba")
    category = Category.create(name: "sport")
    assert_equal "sport", category.name 
    assert_equal 0, category.ideas.count
    category.ideas << idea
    assert_equal 1, category.ideas.count
  end

end
