class Offer < ApplicationRecord
  has_many :targets, dependent: :destroy

  validates :description, presence: true,
                          length: { maximum: 255 },
                          uniqueness: { case_sensitive: false }

  scope :for_user, lambda { |user|
    includes(:targets)
      .where(targets: { min_age: ..user.age, max_age: user.age.., genders: [user.gender]})
  }
end
