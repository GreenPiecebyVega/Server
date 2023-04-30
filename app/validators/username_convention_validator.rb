class UsernameConventionValidator < ActiveModel::EachValidator
  def validate_each(record, field, value)
    return if value.blank?

    record.errors[field] << I18n.t('models.users.username_only_letters_and_numbers') unless value =~ /^[[:alnum:]]+$/
    record.errors[field] << I18n.t('models.users.username_should_start_with_letters') unless value[0] =~ /[A-Za-z]/
    record.errors[field] << I18n.t('models.users.username_not_allowed_caracteres') unless value.ascii_only?
  end
end
