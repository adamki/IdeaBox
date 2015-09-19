require "test_helper"

class AdminFlowTest < ActionDispatch::IntegrationTest

  test 'logged in admin sees categories index' do
    skip
    admin = User.create(username: "admin",
                        password: "password",
                        admin: true)

    ApplicationController.any_instance.stubs(:current_user).returns(admin)
    visit admin_categories_path
    assert page.has_content?("All Categories")
  end
end
