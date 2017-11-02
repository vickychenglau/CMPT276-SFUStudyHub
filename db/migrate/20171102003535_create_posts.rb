class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.references :topic
      t.references :user
      t.text :text
      t.float :rating
      t.boolean :anon
      t.integer :parent
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps null: false
    end
  end
end
