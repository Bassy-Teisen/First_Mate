# frozen_string_literal: true

class VoyagePolicy
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
    user.has_any_role?(:user)
  end

  def edit?
    update?
  end

  def destroy?
    create?
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
