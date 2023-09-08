class Offer < ApplicationRecord
  validates :description, presence: true,
                          length: { maximum: 255 },
                          uniqueness: { case_sensitive: false }
end
