class RemoveColumnFromEvents < ActiveRecord::Migration[5.1]
  def change
    remove_column :events, :title, :string
    remove_column :events, :description, :text
  end
end
