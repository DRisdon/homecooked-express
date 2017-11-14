class AttendeeDinner < ApplicationRecord
  belongs_to :attendee, class_name: "User"
  belongs_to :dinner
end
