class User < ApplicationRecord
  has_secure_password

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :first_name, presence: true, length: { maximum: 30 }
  validates :last_name, presence: true, length: { maximum: 30 }
  validates_date :birthdate, presence: true, before: lambda { 13.years.ago.to_date },
                             before_message: "must be at least 13 years old"
  validates :email, presence: true,
                    format: { with: VALID_EMAIL_REGEX },
                    length: { maximum: 255 },
                    uniqueness: { case_sensitive: false }

  def age
    return unless birthdate

    today = Date.current
    est_age = today.year - birthdate.year
    
    if today.month <= birthdate.month && today.day > birthdate.day
      est_age - 1
    else
      est_age
    end
  end
end
