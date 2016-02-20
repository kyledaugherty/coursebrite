class Organization < ActiveRecord::Base
  has_many :memberships, as: :joinable, dependent: :destroy
  has_many :members, through: :memberships

  before_save :downcase_login

  validates_presence_of :login

  private

  def downcase_login
    login.downcase!
  end
end
