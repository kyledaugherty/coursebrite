class Organization < ActiveRecord::Base
  resourcify

  has_many :memberships, as: :joinable, dependent: :destroy
  has_many :members, through: :memberships

  before_save :downcase_login

  validates_presence_of :login

  def add_member_with_role(member, role_name)
    add_member(member)
    grant_role_to_member(member, role_name)
  end

  private

  def add_member(member)
    members << member
  end

  def downcase_login
    login.downcase!
  end

  def grant_role_to_member(member, role_name)
    member.add_role role_name, self
  end
end
