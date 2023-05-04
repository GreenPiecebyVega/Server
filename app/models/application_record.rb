# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  # Enums Traductions on i18n
  def self.humanize_enum(enum, value)
    I18n.t("activerecord.attributes.#{model_name.i18n_key}.#{enum.to_s.pluralize}.#{value}")
  end

  def humanize_enum(enum)
    I18n.t("activerecord.attributes.#{model_name.i18n_key}.#{enum.to_s.pluralize}.#{send(enum)}")
  end
end
