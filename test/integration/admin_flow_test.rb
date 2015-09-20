require "test_helper"

class AdminFlowTest < ActionDispatch::IntegrationTest
  test 'logged in admin sees categories index' do
    admin = User.create(username: "admin",
                        password: "password",
                        role: 1)

    ApplicationController.any_instance.stubs(:current_user).returns(admin)
    visit admin_categories_path
    assert page.has_content?("All Categories")
  end

  test 'default user does not see admin categories index' do
    user = User.create(username: "default_user",
                        password: "password",
                        role: 0)

    ApplicationController.any_instance.stubs(:current_user).returns(user)
    visit admin_categories_path
    refute page.has_content?("All Categories")
    assert page.has_content?("The page you were looking for doesn't exist.")
  end

  test 'an admin can add a category' do
    admin = User.create(username: "admin",
                        password: "password",
                        role: 1)

    ApplicationController.any_instance.stubs(:current_user).returns(admin)
    visit admin_categories_path
    click_link 'Add a new Category'
    fill_in 'Name', with: "Education"
    click_button 'Create Category'
    assert page.has_content?("Education")
    assert_equal admin_categories_path, current_path
  end

  test 'an admin can edit an existing category' do
    admin = User.create(username: "admin",
                        password: "password",
                        role: 1)

    ApplicationController.any_instance.stubs(:current_user).returns(admin)
    visit admin_categories_path
    click_link 'MyString'
    fill_in 'Name', with: 'Business'

    click_button 'Update Category'

    assert page.has_content?('Business')
  end

  test 'an admin can delete a category' do
    assert_equal 1, Category.count
    admin = User.create(username: "admin",
                        password: "password",
                        role: 1)

    ApplicationController.any_instance.stubs(:current_user).returns(admin)
    visit admin_categories_path
    click_link 'Delete'

    refute page.has_content?("MyString")
    assert_equal 0, Category.count
  end
end
