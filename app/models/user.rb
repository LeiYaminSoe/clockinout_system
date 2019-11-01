class User < ApplicationRecord
  has_many :clock_events

  validates :username, presence: true
end
