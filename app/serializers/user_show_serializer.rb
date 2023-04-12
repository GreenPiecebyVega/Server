# frozen_string_literal: true

class UserShowSerializer
  include FastJsonapi::ObjectSerializer

  set_key_transform :camel_lower

  attributes :id,
             :username,
             :email,
             :slug
end
