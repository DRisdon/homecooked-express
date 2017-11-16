class Dinner < ApplicationRecord
  belongs_to :host, class_name: "User"
  has_many :attendee_dinners, foreign_key: "dinner_id"
  has_many :attendees, through: :attendee_dinners, source: :attendee
  has_many :invites, foreign_key: "dinner_id"
  has_many :invited, through: :invites, source: :invited

  validates :starts_at, presence: true
  validates :location, presence: true
  validates :host_id, presence: true
end
