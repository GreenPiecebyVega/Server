# frozen_string_literal: true

class UserCharacterPolicy < ApplicationPolicy
  def character_list?
    user.staf? || user.client?
  end

  def update?
    user.master? || (user.id == record.user_id)
  end

  def destroy?
    user.master? || (user.id == record.user_id)
  end

  class Scope < Scope
    def resolve
      if user.mestre?
        scope.all
      elsif user.player?
        scope.where(user_id: user.id)
      end
    end
  end
end
