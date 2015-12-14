class CreatePieces < ActiveRecord::Migration
  def change
    create_table :pieces do |t|
        t.text :label
        t.text :path # or url
        t.integer :puzzle_id
        t.timestamps null: false
    end
  end
end
