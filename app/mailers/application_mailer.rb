# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'GreenPiece MMORPG <no-reply@vegasoft.com>'
  layout 'mailer'
end
