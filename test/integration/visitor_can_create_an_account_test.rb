class VisitorFlowTest <ActionDispatch::IntegrationTest
  test 'a visitor can create an account' do
    visit '/'

    click_link "Create Account"
    assert_equal new_user_path, current_path
    fill_in "Username", with: "Timothy"
    fill_in "Password", with: "asdf"
    click_on "Create Account"
    assert_equal ideas_path, current_path
    assert_equal "Timothy", User.last.username
  end
end
