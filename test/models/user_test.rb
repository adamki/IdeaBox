require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def valid_params
    { username: "adam", password: "qwerty" }
  end

  it "is valid with valid params" do
    user = User.new valid_params
    user.must_be :valid?
  end

  it "is invalid without a name" do
    params = valid_params.clone
    params.delete :username
    user = User.new params

    user.wont_be :valid?
   end
end
