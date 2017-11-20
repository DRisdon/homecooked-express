class AttendeeDinner < ApplicationRecord
  belongs_to :attendee, class_name: "User"
  belongs_to :dinner

  validates :attendee_id, :uniqueness => { :scope => :dinner_id }

end
