class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.string :login, limit: 255, null: false

      t.timestamps null: false
    end

    add_index :organizations, :login, unique: true
  end
end
