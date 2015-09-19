require 'test_helper'

class UserFlowTest <ActionDispatch::IntegrationTest

  test 'a registered user can log in with correct password' do
    @user = User.create(username: 'adam', password: 'password')

    visit login_path
    fill_in 'Username', with: "adam"
    fill_in 'Password', with: "password"
    click_button "Login"
    assert_equal ideas_path, current_path
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

  test 'a logged in user can create an idea' do
    user = User.create(username: "rachel", password: "password")

    visit login_path
    fill_in "Username", with: user.username
    fill_in "Password", with: "password"
    click_button "Login"

    visit ideas_path
    click_link "Add an Idea"
    fill_in "Name", with: "More Gnarly MTB rides!"
    click_button "Create Idea"
    assert page.has_content?("More Gnarly MTB rides!")
  end
end
