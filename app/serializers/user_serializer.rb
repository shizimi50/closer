class UserSerializer < ActiveModel::Serializer
  attributes :id, :name

  has_one :assignment_chore_day

end
