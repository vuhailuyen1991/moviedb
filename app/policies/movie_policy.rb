class MoviePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def create?
    user
  end

  def destroy?
    update?
  end

  def update?
    user && record.user == user
  end

  def rate?
    user
  end

  def search?
    true
  end
end