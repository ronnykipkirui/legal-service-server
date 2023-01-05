class DisputeCategory < ApplicationRecord
    has_many :disputes
    has_many :dispute_types
    has_many :advocates, through: :disputes



end
