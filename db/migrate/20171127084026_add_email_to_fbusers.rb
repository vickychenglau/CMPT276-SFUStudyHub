class AddEmailToFbusers < ActiveRecord::Migration
  def change
    add_column :fbusers, :email, :string
    add_column :fbusers, :tutor, :boolean
  end
end
