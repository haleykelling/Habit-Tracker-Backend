class User < ApplicationRecord
    has_secure_password
    has_many :habits

    validates :first_name, :last_name, :password, presence: true
    validates :email, presence: true, uniqueness: true

end
