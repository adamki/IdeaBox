class VisitorFlowTest <ActionDispatch::IntegrationTest


  test 'a visitor can create an account' do
    visit '/'

    click_link "Create Account"
    assert_equal new_user_path, current_path
    fill_in "Username", with: "Timothy"
    fill_in "Password", with: "asdf"
    within('.new_user') do
      click_on "Create Account"
    end
    assert_equal "Timothy", User.last.username
  end

  test 'a visitor must enter a username and password to create an account' do
    visit '/'

    user_count = User.count
    click_link "Create Account"
    assert_equal new_user_path, current_path
    fill_in "Username", with: "Timothy"
    fill_in "Password", with: ""
    within('.new_user') do
      click_on "Create Account"
    end
    assert_equal 0, user_count
    assert_equal new_user_path, current_path

  end
end
