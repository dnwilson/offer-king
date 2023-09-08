class Target < ApplicationRecord
  belongs_to :offer

  validates :min_age, presence: true, numericality: { greater_than_or_equal_to: 13,  only_integer: true }
  validates :max_age, presence: true, numericality: { greater_than_or_equal_to: 13,  only_integer: true }
  validates :genders, presence: true

  validate :valid_genders

  private

  def valid_genders
    return if genders.all? { |gender| gender.in?(User.genders.values) }

    errors.add(:genders, "contains unrecognized genders")
  end
end
