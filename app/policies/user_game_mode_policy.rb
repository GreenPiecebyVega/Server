# frozen_string_literal: true

class UserGameModePolicy < ApplicationPolicy
  def index?
    user.master? || user.player?
  end

  def update_active_game_mode?
    user.master? || (user.id == record.user_id)
  end

  class Scope < Scope
    def resolve
      if user.master?
        scope.all
      elsif user.player?
        scope.where(user_id: user.id)
      end
    end
  end
end
