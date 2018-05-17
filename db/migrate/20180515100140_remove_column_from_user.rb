class RemoveColumnFromUser < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :student_group, :integer
  end
end
