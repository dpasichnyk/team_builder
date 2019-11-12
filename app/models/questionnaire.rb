class Questionnaire < ApplicationRecord
  has_and_belongs_to_many :users

  scope :active, -> { where(active: true) }

  # @return [nil]
  # @return [Questionnaire] currently active questionnaire.
  def self.current
    active.first
  end
end
