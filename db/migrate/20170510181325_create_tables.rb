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
      t.column(:instructions, :string)

      t.timestamps
    end

    create_table(:catagories) do |t|
      t.column(:name, :string)

      t.timestamps
    end

    create_table(:ingredients_recipes) do |t|
      t.column(:ingredients_id, :integer)
      t.column(:recipes_id, :integer)

      t.timestamps
    end

    create_table(:catagories_recipes) do |t|
      t.column(:catagories_id, :integer)
      t.column(:recipes_id, :integer)

      t.timestamps
    end
  end
end
