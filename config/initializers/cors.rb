Rails.application.config.middleware.insert_before 0, Rack::Cors do
  if Rails.env.development?
    origins = [
      'localhost:3000', 'localhost:3001', 'localhost:5000'
    ].freeze
    allow do
      origins origins
      resource '*',
               headers: :any,
               methods: %i[get post put patch delete options head]
    end
  else
    origins = [
      'staging.xyz.com', 'www.xyz.com'
    ].freeze
    allow do
      origins origins
      resource '*',
               headers: :any,
               methods: %i[get post put patch delete options head]
    end
  end
end
