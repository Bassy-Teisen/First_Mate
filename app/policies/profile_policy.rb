# frozen_string_literal: true

class ProfilePolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @profile = record
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
    return true if @user.profile == @profile || @user.has_role?(:admin)
  end

  def edit?
    update?
  end


  def destroy?
    update?
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
