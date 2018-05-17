class Dinner < ApplicationRecord
  belongs_to :host, class_name: "User" # has 1 host
  has_many :attendee_dinners, foreign_key: "dinner_id" # has many attendee_dinners join entries, with the dinner_id key
  has_many :attendees, through: :attendee_dinners, source: :attendee # has many attendees through the attendee_dinners table
  has_many :invites, foreign_key: "dinner_id" # has many invites join entries, on a dinner_id key
  has_many :invited, through: :invites, source: :invited # has many invited users through the invites table
  has_many :recipes # has many recipes
  has_many :comments

  validates :starts_at, presence: true
  validates :location, presence: true
  validates :host_id, presence: true

  def all_info
    recipes = self.recipes.map do |recipe|
      recipe.parse_recipe_no_ingredients
    end
    comments = self.comments.map do |comment|
      comment.comment_info
    end
    {
      :info => self,
      :host => self.host.json_hash_no_token,
      :attendees => self.attendees.select(:id, :name, :email, :avatar),
      :invited => self.invited.select(:id, :name, :email, :avatar),
      :recipes => recipes,
      :comments => comments
    }
  end

end
