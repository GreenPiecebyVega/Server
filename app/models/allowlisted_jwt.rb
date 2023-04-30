# frozen_string_literal: true

# == Schema Information
#
# Table name: allowlisted_jwts
#
#  id           :bigint           not null, primary key
#  aud          :string(255)      not null
#  browser_data :string(255)
#  device_data  :string(255)
#  exp          :datetime         not null
#  jti          :string(255)      not null
#  os_data      :string(255)
#  remote_ip    :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :bigint           not null
#
# Indexes
#
#  index_allowlisted_jwts_on_jti      (jti) UNIQUE
#  index_allowlisted_jwts_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id) ON DELETE => cascade
#
class AllowlistedJwt < ApplicationRecord
end
