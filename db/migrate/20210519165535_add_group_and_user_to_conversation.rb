class AddGroupAndUserToConversation < ActiveRecord::Migration[6.1]
  def change
    add_reference :conversations, :user, foreign_key: true
    add_reference :conversations, :group, foreign_key: true
  end
end
