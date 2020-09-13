class User < ActiveRecord::Base
    has_secure_password
    has_many :movies, foreign_key: "user_id"
    has_many :reviews
    validates :email, presence: true, uniqueness: true
end
