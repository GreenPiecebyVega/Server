Apipie.configure do |config|
  config.app_name                = 'Green Piece'
  config.app_info                = ''
  config.copyright               = "Vega Soft \u00A9 Todos os direitos reservador"
  config.api_base_url            = 'localhost:3000/api/v1'
  config.doc_base_url            = 'apipie'
  # config.authenticate = Proc.new do
  #   authenticate_or_request_with_http_basic do |username, password|
  #     username == "username" && password == "password"
  #   end
  # end
  # where is your API defined?
  config.api_controllers_matcher = "#{Rails.root}/app/controllers/**/*.rb"
end
