class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table(:tasks) do |table|
      table.column(:description, :string)
      table.column(:done, :boolean)

      table.timestamps()
    end
  end
end
