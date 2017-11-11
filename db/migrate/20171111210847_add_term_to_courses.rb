class AddTermToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :term, :string
  end
end
