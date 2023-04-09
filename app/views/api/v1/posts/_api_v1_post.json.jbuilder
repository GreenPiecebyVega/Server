# frozen_string_literal: true

json.extract! api_v1_post, :id, :title, :content, :created_at, :updated_at
json.url api_v1_post_url(api_v1_post, format: :json)
