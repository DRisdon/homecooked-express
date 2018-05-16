class Comment < ApplicationRecord
  belongs_to :dinner
  belongs_to :user
end
