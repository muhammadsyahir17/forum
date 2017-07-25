class User < ApplicationRecord
    has_secure_password
    enum role: [:user, :moderator, :admin]
end
