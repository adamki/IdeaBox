class Idea < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_and_belongs_to_many :images

  validates :name, presence: :true
end
