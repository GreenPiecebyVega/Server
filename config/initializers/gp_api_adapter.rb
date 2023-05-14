# config/initializers/json_api_adapter.rb
class GpApiAdapter < ActiveModel::Serializer::Adapter::JsonApi
  def serializable_hash(options = nil)
    hash = super
    if options && options[:message]
      hash[:code] = options[:code] if options[:code]
      hash[:message] = options[:message] if options[:message]
    end
    hash
  end
end
