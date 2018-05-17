class RemnameCommentColumnToAppointments < ActiveRecord::Migration[5.1]
  def change
    rename_column :appointments, :comment, :description 
  end
end
