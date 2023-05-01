# == Schema Information
#
# Table name: base_characters
#
#  id         :bigint           not null, primary key
#  class      :string(255)      not null
#  name       :string(255)      not null
#  slug       :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class BaseCharacter < ApplicationRecord
end
