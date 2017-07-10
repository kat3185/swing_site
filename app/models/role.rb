class Role < ApplicationRecord
  has_many :user_roles
  has_many :users, through: :user_roles

  validates_presence_of :name

  scope :admin, -> { where(name: "Admin").first }
  scope :owner, -> { where(name: "Owner").first }
  scope :student, -> { where(name: "Student").first }

  def self.with_admin_privledges
    [self.admin, self.owner]
  end
end
