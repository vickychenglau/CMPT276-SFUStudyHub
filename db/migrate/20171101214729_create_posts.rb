class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.int :topic_id
      t.int :user_id
      t.text :text
      t.float :rating
      t.int :parent
      t.bool :anon

      t.timestamps null: false
    end
  end
end
