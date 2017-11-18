class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.text :comment
      t.references :person_rating
      t.references :person_rated

      t.timestamps null: false
    end
  end
end
