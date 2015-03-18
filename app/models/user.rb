class User < ActiveRecord::Base

  has_many :searches, dependent: :destroy

  # Virtual attribute
  attr_accessor :remember_token

  #before_save { email.downcase! }

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
  validates :password, presence: true, length: { minimum: 8 }, format: { with: VALID_PASSWORD_REGEX }, allow_blank: true

  # Return the hash digest of the given string
  # Necessary to hash passwords outside the has_secure_password
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # Return a random token for remember digest (cookies)
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  def remember
    # set the class variable to be a new token (22 character string)
    self.remember_token = User.new_token

    # Update the remember digest db column with a hashed version of the token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  # Forget a user cookie
  def forget
    update_attribute(:remember_digest, nil)
  end
end
