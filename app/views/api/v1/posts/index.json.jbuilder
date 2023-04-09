# frozen_string_literal: true

json.array! @api_v1_posts, partial: 'api_v1_posts/api_v1_post', as: :api_v1_post
