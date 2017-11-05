class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name

      t.timestamps null: false
<<<<<<< HEAD
=======
      # validates :name, :presence =>true
>>>>>>> 3967ef43531f6896b6336b214862aee380b7fe4f
    end
  end
end
