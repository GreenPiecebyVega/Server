# spec/support/factory_bot.rb
RSpec.configure do |config|
  # FactoryBot Methods
  # Allow us as developer to write create(:factory), build(:factory) and so on,
  # in the place of FactoryBot.create or update and so on
  config.include FactoryBot::Syntax::Methods
end
