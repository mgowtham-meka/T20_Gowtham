class Team < ApplicationRecord
    has_many :players
    
    # accepts_nested_attributes_for :players, allow_destroy: true

    
    validates :name, presence: true
    validates :country, presence: true
    validates :founded, presence: true, numericality: { greater_than: 1901 }
    validates :description, presence: true

end




 