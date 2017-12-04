class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.datetime :start
      t.datetime :end
      t.string :color
      t.integer :course_id
      t.integer :user_id

      t.timestamps null: false
    end

    add_index :events, :course_id
    add_index :events, :user_id 
  end
end
