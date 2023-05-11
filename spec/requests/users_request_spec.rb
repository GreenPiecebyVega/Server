# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'devise auth', type: :request do
  before :each do
    @current_usuario = create(:user, :player, :free)
  end
end
