class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.int :user_ID
      t.string :username
      t.string :password
      t.string :last_name
      t.string :first_name
      t.string :email

      t.timestamps null: false
    end
  end
end
