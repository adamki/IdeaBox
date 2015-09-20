class User < ActiveRecord::Base
  has_secure_password
  has_many :ideas

  validates :username, :password, presence: :true

  enum role: %w(default admin)
end
