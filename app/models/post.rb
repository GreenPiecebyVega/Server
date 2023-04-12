# == Schema Information
#
# Table name: posts
#
#  id           :bigint           not null, primary key
#  user_id      :bigint           not null
#  title        :string(255)      not null
#  content      :text(65535)      not null
#  published_at :datetime
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Post < ApplicationRecord
  include Posts::Associations
  include Posts::Scopes
  include Posts::Logic
  include Posts::Validations

  extend FriendlyId
  friendly_id :title, use: [:slugged]
end
