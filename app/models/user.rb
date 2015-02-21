class User < ActiveRecord::Base

  before_save { email.downcase! }

  # Force email addresses to be lowercase
  before_save { self.email = email.downcase }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }

  # Save a securely hashed password_digest attribute to the db
  # Two virtual attributes (password and password_confirmation) + presence validations
  # Auth method build in
  has_secure_password

  # http://www.zorched.net/2009/05/08/password-strength-validation-with-regular-expressions/
  # Zero-width positive lookahead assertions
  # @todo Need test for this
  VALID_PASSWORD_REGEX = /(?=.*[a-z])(?=.*[\d])(?=.*[\W])(?=.*[A-Z])/

  # Virtual Model Attributes from has_secure_password
  validates :password, presence: true, length: { minimum: 8 }, format: { with: VALID_PASSWORD_REGEX }

  # Return the hash digest of the given string
  # Necessary to hash passwords outside the has_secure_password
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
end
