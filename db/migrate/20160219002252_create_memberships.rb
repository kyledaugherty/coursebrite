class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.integer :joinable_id, null: false
      t.string :joinable_type, limit: 255, null: false
      t.integer :member_id, null: false

      t.timestamps null: false
    end

    add_index :memberships, [:joinable_id, :joinable_type]
    add_index :memberships, :member_id
  end
end
