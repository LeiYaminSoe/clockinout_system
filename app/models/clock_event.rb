class ClockEvent < ApplicationRecord
  belongs_to :user

  validates :user_id, presence: true
  validates :event_type, presence: true
  validates :event_action, presence: true
  validates :event_time, presence: true
end
