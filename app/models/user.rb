class User < ActiveRecord::Base

  # Force email addresses to be lowercase
  before_save { self.email = email.downcase }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }

  # Save a securely hashed password_digest attribute to the db
  # Two virtual attributes (password and password_confirmation) + presence validations
  # Auth method build in
  has_secure_password
end
