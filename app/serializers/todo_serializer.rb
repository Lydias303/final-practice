class TodoSerializer < ActiveModel::Serializer
  attributes :id, :title, :finished, :priority
end
