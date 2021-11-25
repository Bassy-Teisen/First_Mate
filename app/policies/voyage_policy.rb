class VoyagePolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @voyage = record
  end

  def index?
    true
  end

  def show?
    true
  end
  
  def about?
    true
  end

  def create?
    user.has_role?(:user)
  end

  def new?
    create?
  end

  def update?
    return true if @user.voyage == @voyage || user.has_any_role?(:admin) 
  end

  def edit?
    update?
  end

  def destroy?
    update?
  end

  def joiner?
    create?
  end
  
  def join?
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
