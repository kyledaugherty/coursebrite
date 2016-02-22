class Role < ActiveRecord::Base
  belongs_to :resource, polymorphic: true
  has_and_belongs_to_many :users, join_table: :users_roles

  validates :name, presence: true
  validates :resource_id, presence: true
  validates :resource_type,
            inclusion: { in: Rolify.resource_types },
            presence: true

  scopify
end
