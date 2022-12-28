class Dispute < ApplicationRecord
    belongs_to :advocate
    belongs_to :client
    belongs_to :dispute_category
end
