class Dinner < ApplicationRecord
  belongs_to :host, class_name: "User"
  has_many :attendee_dinners, foreign_key: "dinner_id"
  has_many :attendees, through: :attendee_dinners, source: :attendee
  has_many :invites, foreign_key: "dinner_id"
  has_many :invited, through: :invites, source: :invited
  has_many :recipes

  validates :starts_at, presence: true
  validates :location, presence: true
  validates :host_id, presence: true

  def all_info
    recipes = self.recipes.map do |recipe|
      recipe.parse_recipe_no_ingredients
    end
    {
      :info => self,
      :host => self.host.json_hash_no_token,
      :attendees => self.attendees.select(:id, :name, :email, :avatar),
      :invited => self.invited.select(:id, :name, :email, :avatar),
      :recipes => recipes
    }
  end

end
