class Conversation < ApplicationRecord
  belongs_to :user
  belongs_to :group
  has_many :members
end
