class CreateLists < ActiveRecord::Migration[5.2]
  def change
    create_table(:lists) do |table|
      table.column(:name, :string)

      table.timestamps
    end
    # a column for which list a task belongs to 
    add_column(:tasks, :list_id, :integer)
  end
end
