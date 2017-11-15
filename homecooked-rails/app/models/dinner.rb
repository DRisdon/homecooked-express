class Dinner < ApplicationRecord
  belongs_to :host, class_name: "User"
  has_many :attendee_dinners, foreign_key: "dinner_id"
  has_many :attendees, through: :attendee_dinners, source: :attendee
end
