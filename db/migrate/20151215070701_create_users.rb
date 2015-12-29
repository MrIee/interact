class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
        t.text :first_name
        t.text :last_name
        t.text :email
        t.text :username
        t.text :password_digest
        t.text :profile_picture
        t.text :public_id
      t.timestamps null: false
    end
  end
end
