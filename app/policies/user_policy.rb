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
      scope
    end
  end
end
