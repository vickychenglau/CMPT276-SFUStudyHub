class CreateFbusers < ActiveRecord::Migration
  def change
    create_table :fbusers do |t|
      t.string :provider
      t.string :uid
      t.string :name
      t.string :oauth_token
      t.datetime :oauth_expires_at

      t.timestamps null: false
    end
  end
end
