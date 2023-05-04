# frozen_string_literal: true

class UserPolicy < ApplicationPolicy
  def update?
    user.master? || (user.id == record.id)
  end

  def destroy?
    user.master? || (user.id == record.id)
  end

  class Scope < Scope
    def resolve
      if user.mestre?
        scope.all
      elsif user.player?
        scope.where(id: user.id)
      end
    end
  end
end
