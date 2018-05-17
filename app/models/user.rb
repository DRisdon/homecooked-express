class User < ApplicationRecord

 has_many :hosted_dinners, class_name: "Dinner", foreign_key: "host_id"
 has_many :attendee_dinners, foreign_key: "attendee_id"
 has_many :attended_dinners, through: :attendee_dinners, source: :dinner
 has_many :invites, foreign_key: "invited_id"
 has_many :invited_dinners, through: :invites, source: :dinner
 has_many :comments
  # we want the user to have an encrypted password
 has_secure_password

 # we want there to be a unique, secure token for each user
 has_secure_token :auth_token

 # down case the email before validation to ensure uniqueness
 before_validation :downcase_email

 # make sure there is a password confirmation
 validates :password_confirmation, presence: true, on: :create
 validates :password, confirmation: true, presence: true, on: :create

 # make sure the email is the correct format, unique, and present
 validates :email,
   presence: true,
   uniqueness: true,
   format: {
     with: /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/,
     message: "Invalid email address"
   }

 # make sure there is a name
 validates :name, presence: true

 def json_hash
   {
     :name => self.name,
     :email => self.email,
     :token => self.auth_token,
     :id => self.id,
     :avatar => self.avatar
   }
 end

 def json_hash_no_token
   {
     :name => self.name,
     :email => self.email,
     :id => self.id,
     :avatar => self.avatar
   }
 end

 private

 def downcase_email
   self.email = email.downcase if email.present?
 end

end
