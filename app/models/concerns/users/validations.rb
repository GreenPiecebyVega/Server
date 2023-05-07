# frozen_string_literal: true

module Users
  module Validations
    extend ActiveSupport::Concern

    included do
      validates :name, :lastname, :data_nascimento, :sexo,
                :telefone,
                presence: true
      validates :email,
                presence: true,
                uniqueness: { case_sensitive: false }
      validates :username,
                presence: true,
                length: { minimum: 6, maximum: 16 },
                uniqueness: { case_sensitive: false },
                username_convention: true
    end
  end
end
