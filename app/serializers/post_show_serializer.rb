class PostShowSerializer
  include FastJsonapi::ObjectSerializer

  set_key_transform :camel_lower

  attributes :id,
             :slug,
             :title,
             :published_at
        
  attribute :user do |post|
    {
      id: post.user_id,
      slug: post.user.slug,
      username: post.user.username.presence || post.user_id
    }
  end
end
