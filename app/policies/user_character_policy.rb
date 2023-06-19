# frozen_string_literal: true

class UserCharacterPolicy < ApplicationPolicy
  def index?
    user.master? || user.player?
  end

  def create?
    user.master? || user.player?
  end

  def update?
    user.master? || (user.id == record.user_game_mode.user_id)
  end

  def destroy?
    user.master? || (user.id == record.user_game_mode.user_id)
  end

  class Scope < Scope
    def resolve
      if user.master?
        scope.all
      else
        scope.includes(:user_game_mode)
             .where(user_game_mode: { user_id: user.id })
             .order(lv: :desc)
      end
    end
  end
end
