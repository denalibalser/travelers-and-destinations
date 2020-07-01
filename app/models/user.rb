class User < ActiveRecord::Base
    has_secure_password
    validates :username, uniqueness: true
    validates :username, presence: true
    validates :email, presence: true, :format => {:with => /\w+@\w+\.\w+/}
    

    has_many :destinations

end 