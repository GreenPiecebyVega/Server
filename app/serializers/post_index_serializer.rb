class PostIndexSerializer
  include FastJsonapi::ObjectSerializer

  set_key_transform :camel_lower

  attributes :id,
             :content,
             :published_at,
             :slug,
             :title

  attribute :user do |post|
    post.user.username
  end
end
