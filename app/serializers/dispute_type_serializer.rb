class DisputeTypeSerializer < ActiveModel::Serializer
  attributes :id, :dispute_category_id, :dispute_name
end
