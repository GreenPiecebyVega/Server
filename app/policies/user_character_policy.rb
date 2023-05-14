# frozen_string_literal: true

class UserCharacterPolicy < ApplicationPolicy
  def index?
    user.staf_member? || user.client?
  end

  def update?
    user.master? || (user.id == record.user_id)
  end

  def destroy?
    user.master? || (user.id == record.user_id && record.lv < 100)
  end

  class Scope < Scope
    def resolve
      if user.mestre?
        scope.all
      else
        scope.where(user_id: user.id).order(lv: :desc)
      end
    end
  end
end
