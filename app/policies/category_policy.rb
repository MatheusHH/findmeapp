class CategoryPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
    	if user.admin?
      		scope.all
      	else
      		raise Pundit::NotAuthorizedError, 'Not allowed to view this action'
      	end
    end
  end

  def index?
  	user.admin?
  end

  def new?
  	user.admin?
  end

  def destroy?
    user.admin?
  end

  def edit?
  	record.user_id == user.id
  end
end
