class CreateGuesses < ActiveRecord::Migration
  def change
    create_table :guesses do |t|
      t.integer :user_id, null: false
      t.integer :card_id, null: false
      t.boolean :correct, default: false, null: false

      t.timestamps null: false
    end
  end
end
