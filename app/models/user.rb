class User < ActiveRecord::Base
    has_secure_password
    has_many :movies
    has_many :reviews
    validates :name, :email, presence: true, uniqueness: true
end
