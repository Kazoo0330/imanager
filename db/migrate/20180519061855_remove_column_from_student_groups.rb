class RemoveColumnFromStudentGroups < ActiveRecord::Migration[5.1]
  def change
    remove_column :student_groups, :user_id, :integer
  end
end
