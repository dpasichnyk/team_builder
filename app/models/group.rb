class Group < ApplicationRecord
  belongs_to :admin, class_name: 'User'
  has_and_belongs_to_many :users

  scope :active, -> { where(active: true) }
end
