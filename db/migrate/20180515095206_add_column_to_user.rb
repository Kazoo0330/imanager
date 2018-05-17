class AddColumnToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :student_group, :integer
  end
end
