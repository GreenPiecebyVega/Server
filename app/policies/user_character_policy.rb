# frozen_string_literal: true

class UserCharacterPolicy < ApplicationPolicy
  def index?
    user.master? || user.player?
  end

  def create?
    user.master? || user.player?
  end

  def update?
    user.master? || (user.id == record.usario_id)
  end

  def destroy?
    user.master? || (user.id == record.usario_id)
  end

  class Scope < Scope
    def resolve
      if user.master?
        scope.all
      else
        scope.where(user_id: user.id)
      end
    end
  end
end
