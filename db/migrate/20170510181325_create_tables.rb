class CreateTables < ActiveRecord::Migration[5.1]
  def change
    create_table(:ingredients) do |t|
      t.column(:name, :string)

      t.timestamps
    end

    create_table(:recipes) do |t|
      t.column(:name, :string)
      t.column(:description, :string)
      t.column(:rating, :integer)
      t.column(:instruction, :string)

      t.timestamps
    end

    create_table(:categories) do |t|
      t.column(:name, :string)

      t.timestamps
    end

    create_join_table(:ingredients, :recipes) do |t|
      t.timestamps
    end

    create_join_table(:categories, :recipes) do |t|
      t.timestamps
    end
  end
end
