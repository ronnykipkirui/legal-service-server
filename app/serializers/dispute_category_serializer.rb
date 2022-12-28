class DisputeCategorySerializer < ActiveModel::Serializer
  attributes :id, :category_name, :category_description, :advocates
  has_many :dispute_types, except: :dispute_category_id
  
  
  def advocates

    adv = self.object.advocates.uniq
    adv.map{ |a|  AdvocateSerializer.new(a)}
    
  end
end
