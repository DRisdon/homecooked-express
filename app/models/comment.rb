class Comment < ApplicationRecord
  belongs_to :dinner
  belongs_to :user

  validates :user_id, presence: true
  validates :dinner_id, presence: true
  validates :content, presence: true

  # returns a hash that includes info about the poster
  def comment_info
    {
      :user => self.user.json_hash_no_token,
      :dinner_id => self.dinner_id,
      :content => self.content
    }
  end

end
