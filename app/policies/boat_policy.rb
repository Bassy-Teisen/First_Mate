# frozen_string_literal: true

class BoatPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    true
  end

  def show?
    true
  end

  def create?
    user.has_role?(:user)
  end

  def new?
    create?
  end

  def update?
    return true if @user.profile.boat == @boat || user.has_role?(:admin)
  end

  def edit?
    update?
  end

  def destroy?
    upadate?
  end

  class Scope
    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope.all
    end

    private

    attr_reader :user, :scope
  end
end
