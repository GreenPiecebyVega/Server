# frozen_string_literal: true

# == Schema Information
#
# Table name: posts
#
#  id           :bigint           not null, primary key
#  content      :text(65535)      not null
#  published_at :datetime
#  slug         :string(255)      not null
#  title        :string(255)      not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :bigint           not null
#
# Indexes
#
#  index_posts_on_slug     (slug) UNIQUE
#  index_posts_on_user_id  (user_id)
#
class Post < ApplicationRecord
  include Posts::Associations
  include Posts::Scopes
  include Posts::Logic
  include Posts::Validations

  extend FriendlyId
  friendly_id :title, use: [:slugged]
end
