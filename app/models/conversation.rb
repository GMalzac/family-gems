class Conversation < ApplicationRecord
  belongs_to :user
  belongs_to :group
  has_many :members
  has_many :messages
  
  accepts_nested_attributes_for :messages
end
