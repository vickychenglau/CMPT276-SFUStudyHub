class AddStatusToFbusers < ActiveRecord::Migration
  def change
    add_column :fbusers, :status, :string
    
  end
end
