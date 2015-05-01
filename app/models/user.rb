class User < ActiveRecord::Base
  validates :username, :password_digest, :first_name, :last_name, presence: true
  validates :password, length: { minimum: 5, allow_nil: true }
  validates :username, uniqueness: true

  has_secure_password

  after_initialize :ensure_session_token

  attr_reader :password

  def find_by_credentials username, password
    User.find_by_username(username).try(:authenticate, password)
  end

  def password= password
    @password = password
    self.password_digest = BCrypt::Password.create password
  end

  def reset_session_token!
    self.session_token = generate_session_token
    self.save!
    self.session_token
  end

  def ensure_session_token
    self.session_token ||= generate_session_token
  end

  private

  def generate_session_token
    SecureRandom::urlsafe_base64
  end
end
