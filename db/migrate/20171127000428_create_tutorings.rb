class CreateTutorings < ActiveRecord::Migration
  def change
    create_table :tutorings do |t|
      t.references :user, index: true, foreign_key: true
      t.references :course, index: true, foreign_key: true
      t.decimal :hourly
      t.string :mode
      t.text :description

      t.timestamps null: false
    end
  end
end
