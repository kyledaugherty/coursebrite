class RolifyCreateRoles < ActiveRecord::Migration
  def change
    create_table(:roles) do |t|
      t.string :name, limit: 255, null: false
      t.integer :resource_id, null: false
      t.string :resource_type, limit: 255, null: false

      t.timestamps null: false
    end

    create_table(:users_roles, :id => false) do |t|
      t.integer :user_id, null: false
      t.integer :role_id, null: false
    end

    add_index(:roles, :name)
    add_index(:roles, [:name, :resource_type, :resource_id])
    add_index(:users_roles, [:user_id, :role_id])
  end
end
