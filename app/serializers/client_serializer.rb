class ClientSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :phone
end
