require 'digest'

class SessionsController < Devise::SessionsController
  respond_to :json

  def create
    super { |resource| @resource = resource }
  end
end
