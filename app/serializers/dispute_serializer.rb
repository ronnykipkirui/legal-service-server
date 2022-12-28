class DisputeSerializer < ActiveModel::Serializer
  attributes :id, :client_name, :advocate_name, :dispute_category_name, :dispute_description, :dispute_info, :created_at

  def client_name
    "#{self.object.client.name}"
  end

  def advocate_name
    "#{self.object.advocate.name}"
  end

  def dispute_category_name
    "#{self.object.dispute_category.category_name}"
  end


  def dispute_description
    "#{self.object.dispute_category.category_description}"
  end

end
