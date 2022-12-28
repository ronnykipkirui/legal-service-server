class Advocate < ApplicationRecord
    has_secure_password
    has_many :disputes
    has_many :clients, through: :disputes
    has_one :dispute_category, through: :disputes

    validates :name, presence: true
    validates :phone, presence: true
    validates :email, presence: true, uniqueness: true
    validates :years_of_practice, presence: true, numericality: {less_than: 20, greater_than: 3}
    validates :pin_number, presence: true, uniqueness: true
   

end
