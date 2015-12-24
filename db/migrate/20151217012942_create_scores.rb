class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
        t.integer :user_id
        t.integer :puzzle_id
        t.integer :puzzle_size
        t.text :puzzle_score
        t.timestamps null: false
    end
  end
end
