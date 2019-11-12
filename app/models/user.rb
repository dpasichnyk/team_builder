class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  belongs_to :department

  has_and_belongs_to_many :groups
  has_and_belongs_to_many :questionnaires

  validates :email, format: Devise.email_regexp
  validates :first_name, length: { in: 1..250 }
  validates :last_name, length: { in: 1..250 }

  # @return [nil]
  # @return [Group]
  def administered_group
    groups.where(admin_id: id).first
  end

  # @return [Boolean] `true` if user is an admin of active group, `false` otherwise.
  def admin?
    administered_group.present?
  end

  # @return [nil]
  # @return [Group] active user's group if exists.
  def current_group
    groups.active.first
  end
end
