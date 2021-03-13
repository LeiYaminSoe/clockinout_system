class User < ApplicationRecord
  has_secure_password
  has_many :clock_events

  validates :username, presence: true
  validates :email, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, confirmation: true, unless: -> { password.blank? }
  validates :password_confirmation, presence: true
  validates :user_role, presence: true
end
