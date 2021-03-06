# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ActiveRecord::Base
  validates :email, :session_token, uniqueness: true, presence: true
  validates :password_digest, presence: true
  validates :password, length: { minimum: 6, allow_nil: true }

  attr_reader :password
  after_initialize :ensure_session_token

  def self.generate_session_token
    SecureRandom.urlsafe_base64
  end

  def self.find_by_credentials(options)
    possible_user = User.find_by_email(options[:email])
    return ["Email address not found!"] if possible_user.nil?

    possible_user.is_password?(options[:password]) ? possible_user : ["Incorrect password!"]
  end

  def reset_session_token!
    self.session_token = User.generate_session_token
    self.save
    
    self.session_token
  end

  def ensure_session_token
    self.session_token ||= User.generate_session_token
  end

  def password=(password)
    @password = password

    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    digest_bcrypt_object = BCrypt::Password.new(self.password_digest)

    digest_bcrypt_object.is_password?(password)
  end
end
