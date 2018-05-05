class CreateStudentGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :student_groups do |t|
      t.date :year
      t.date :month
      t.string :course_name

      t.timestamps
    end
  end
end
