# frozen_string_literal: true

class UserCharacterPolicy < ApplicationPolicy
  def index?
    true
  end

  def create?
    user.characters.count < 6
  end

  def update?
    user.master? || (user.id == record.user_id)
  end

  def destroy?
    user.master? || (user.id == record.user_id)
  end

  class Scope < Scope
    def resolve
      if user.master?
        scope.all
      else
        scope.where(user_id: user.id).order(lv: :desc)
      end
    end
  end
end
