class Offer < ApplicationRecord
  has_many :targets, dependent: :destroy
  has_many :user_offers, dependent: :destroy
  has_many :users, through: :user_offers

  validates :description, presence: true,
                          length: { maximum: 255 },
                          uniqueness: { case_sensitive: false }

  scope :with_targets, -> { includes(:targets) }
  scope :for_user, lambda { |user|
    subquery = <<-SQL
      SELECT COUNT(*)
      FROM user_offers
      WHERE user_offers.offer_id = offers.id AND user_offers.user_id = #{user.id}
    SQL
    with_targets
      .select("offers.*, (#{subquery}) AS claimed")
      .where(targets: { min_age: ..user.age, max_age: user.age.., genders: [user.gender]})
  }
end
