class UserSerializer < ApplicationSerializer
  type :user

  attributes :id

  has_many :characters
end
