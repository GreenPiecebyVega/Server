# frozen_string_literal: true

class UserPolicy < ApplicationPolicy
  def index?
    user.master?
  end

  def destroy?
    user.master?
  end

  class Scope < Scope
    def resolve
      if user.master?
        scope
      else
        scope.where('user.updated_at', (Date.today - 60.day))
      end
    end
  end
end
