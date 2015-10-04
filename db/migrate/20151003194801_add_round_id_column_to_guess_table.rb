class AddRoundIdColumnToGuessTable < ActiveRecord::Migration
  def change
    add_column :guesses, :round_id, :integer, null: false
  end
end
