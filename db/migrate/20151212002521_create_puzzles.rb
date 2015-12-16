class CreatePuzzles < ActiveRecord::Migration
  def change
    create_table :puzzles do |t|
        t.text :title
        t.integer :height
        t.integer :width
        t.text :path # or url
        t.integer :user_id
        t.timestamps null: false
    end
  end
end
