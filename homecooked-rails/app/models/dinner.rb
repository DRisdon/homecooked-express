class Dinner < ApplicationRecord
  belongs_to :host, class_name: "User"
  has_many :attendee_dinners
  has_many :attendees, through: :attendee_dinners
end
