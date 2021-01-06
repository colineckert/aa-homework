require 'bcrypt'

class User < ApplicationRecord
    attr_reader :password

    validates :email, :session_token, presence: true, uniqueness: true
    validates :password_digest, presence: true
    validates :password, length: {minimum: 6}, allow_nil: true 

    after_initialize :ensure_session_token

    # S
    # P
    # I
    # R +
    # E +

    def self.generate_session_token
        SecureRandom::urlsafe_base64
    end

    def ensure_session_token
        self.session_token ||= User.generate_session_token
    end

    def reset_session_token!
        self.session_token = User.generate_session_token
        self.save!
        self.session_token
    end

    def password=(password)
        self.password_digest = BCrypt::Password.create(password)
        @password = password
    end

    def is_password?(pw)
        BCrypt::Password.new(self.password_digest).is_password?(pw)
    end

    def self.find_by_credentials(email, pw)
        user = User.find_by(email: email)
        user && user.is_password?(pw) ? user : nil
    end
end
