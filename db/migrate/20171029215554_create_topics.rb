class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.references :course, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.text :description
      t.string :title

      t.timestamps null: false
    end
  end
end
