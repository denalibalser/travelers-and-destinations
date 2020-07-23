class Destination < ActiveRecord::Base
    validates :location, presence: true
    validates :description, presence: true
    validates :activities, presence: true 
    
    belongs_to :user
end 