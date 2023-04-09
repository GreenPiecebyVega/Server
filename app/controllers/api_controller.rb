# frozen_string_literal: true

class ApiController < ApplicationController
  before_action :authenticate_user!
end
