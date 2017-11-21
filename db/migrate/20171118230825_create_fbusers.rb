class CreateFbusers < ActiveRecord::Migration
  def change
    create_table :fbusers do |t|
      t.string :provider
      t.string :uid
      t.string :username
      t.string :last_name
      t.string :first_name
      t.string :oauth_token
      t.datetime :oauth_expires_at
      t.string :role
      t.string :email

      t.timestamps null: false
    end
  end
end
