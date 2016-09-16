class SequenceSerializer < ActiveModel::Serializer

  attributes :id

  has_many :tracks

end
