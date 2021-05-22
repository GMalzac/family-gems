class Group < ApplicationRecord
  belongs_to :user
  has_many :members
  has_many :conversations

  accepts_nested_attributes_for :members

  validates :name, presence: true, length: { minimum: 2 }
end
