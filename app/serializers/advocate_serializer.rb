class AdvocateSerializer < ActiveModel::Serializer
  attributes :id, :name, :phone, :email,  :years_of_practice,  :pin_number

  has_many :disputes

  # def dispute_category
  #   "#{self.object.dispute_category.name}"
    
  # end
end

