class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :description
      t.string :title
      t.references :course, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false

<<<<<<< HEAD

=======
      
>>>>>>> 3967ef43531f6896b6336b214862aee380b7fe4f




    end
  end
end
