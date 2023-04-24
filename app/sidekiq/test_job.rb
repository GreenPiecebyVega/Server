# frozen_string_literal: true

class TestJob
  include Sidekiq::Job

  def perform(*args)
    # Do something
  end
end
