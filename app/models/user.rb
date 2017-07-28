class User < ApplicationRecord
    has_secure_password
    enum role: [:user, :moderator, :admin]
    validates :password, length: { minimum: 8  },:presence => true
    validates_confirmation_of :password
end
