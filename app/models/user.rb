class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  before_save :include_student_role

  has_many :posts
  has_many :user_roles
  has_many :roles, through: :user_roles

  def admin?
    !(roles & Role.with_admin_privledges).empty?
  end

private

  def include_student_role
    roles << Role.student
  end
end
