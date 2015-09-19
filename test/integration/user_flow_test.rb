class UserFlowTest <ActionDispatch::IntegrationTest

  test 'a registered user can log in with correct password' do
    @user = User.create(username: 'adam', password: 'password')

    visit login_path
    fill_in 'Username', with: "adam"
    fill_in 'Password', with: "password"
    click_button "Login"
    assert_equal user_path(@user), current_path
    assert page.has_content?("Welcome, adam!")
  end

  test 'a registered user will not be able to login without proper credentials' do
    @user = User.create(username: 'adam', password: 'password')

    visit login_path
    within('.well') do
      fill_in 'Username', with: "adam"
      fill_in 'Password', with: "incorrectstring"
      click_on "Login"
    end
    assert page.has_content?("Invalid login")
  end

  test "logged in user can log out" do
    user = User.create(username: "rachel", password: "password")

    visit login_path
    fill_in "Username", with: user.username
    fill_in "Password", with: "password"
    click_button "Login"
    assert page.has_content?("Welcome, rachel")
    click_link "Logout"
    refute page.has_content?("Welcome, rachel")
  end
end
