class Group < ApplicationRecord
  belongs_to :user
  has_many :members
  has_many :conversations

  accepts_nested_attributes_for :members
end
