class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.text :content
      t.references :member, null: false, foreign_key: true

      t.timestamps
    end
  end
end
