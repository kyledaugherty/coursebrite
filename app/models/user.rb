class User < ActiveRecord::Base
  devise :database_authenticatable, 
         :registerable, 
         :recoverable, 
         :rememberable, 
         :trackable, 
         :validatable

  rolify

  has_many :memberships, foreign_key: :member_id, dependent: :destroy
  has_many  :organizations,
            through: :memberships,
            source: :joinable,
            source_type: "Organization"
end
