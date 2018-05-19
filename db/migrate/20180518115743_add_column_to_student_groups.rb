class AddColumnToStudentGroups < ActiveRecord::Migration[5.1]
  def change
    add_column :student_groups, :year_month, :date
  end
end
