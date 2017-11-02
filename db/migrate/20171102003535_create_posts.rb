class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.reference :topic
      t.reference :user
      t.text :text
      t.float :rating
      t.bool :anon
      t.int :parent
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps null: false
    end
  end
end