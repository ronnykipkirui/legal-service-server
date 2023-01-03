class ClientMeSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :phone

  has_many :disputes
end
