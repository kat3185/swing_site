class UserRole < ApplicationRecord
  self.table_name = "users_roles"
  belongs_to :user
  belongs_to :role

  validates_presence_of :user_id
  validates_presence_of :role_id
end
