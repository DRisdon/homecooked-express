class Invite < ApplicationRecord
  belongs_to :invited, class_name: "User"
  belongs_to :dinner

  validates :invited_id, :uniqueness => { :scope => :dinner_id }

end
