class AddColumnsToStudentGroups < ActiveRecord::Migration[5.1]
  def change
    add_column :student_groups, :user_id, :integer
  end
end
