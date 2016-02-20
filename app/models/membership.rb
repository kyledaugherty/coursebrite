class Membership < ActiveRecord::Base
  belongs_to :joinable, polymorphic: true
  belongs_to :member, class_name: User
end
