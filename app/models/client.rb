class Client < ApplicationRecord
 has_secure_password

 has_many :disputes
 has_many :advocates, through: :disputes

 validates :name, presence: true
 validates :email, presence: true, uniqueness: true
 validates :phone, presence: true
end
