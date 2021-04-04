class Review < ActiveRecord::Base
    belongs_to :user
    
    validates :title, presence: true
    validates :year, presence: true
    validates :rating, presence: true
    validates :content, presence: true
end