class AddTextColumnToGuessesTable < ActiveRecord::Migration
  def change
    add_column :guesses, :guess_text, :string, null: false
  end
end
