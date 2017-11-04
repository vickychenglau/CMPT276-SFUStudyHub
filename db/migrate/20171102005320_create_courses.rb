class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name

      t.timestamps null: false
      validates :name, :presence =>true
    end
  end
end
