# == Schema Information
#
# Table name: allowlisted_jwts
#
#  id           :bigint           not null, primary key
#  user_id      :bigint           not null
#  jti          :string(255)      not null
#  aud          :string(255)      not null
#  exp          :datetime         not null
#  remote_ip    :string(255)
#  os_data      :string(255)
#  browser_data :string(255)
#  device_data  :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# frozen_string_literal

class AllowlistedJwt < ApplicationRecord
end
