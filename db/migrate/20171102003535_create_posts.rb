class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.references :topic
      t.references :user
      t.text :text
      t.boolean :anon
      t.integer :postable_id
      t.string :postable_type
      t.boolean :deleted

      t.timestamps null: false
    end
  end
end
