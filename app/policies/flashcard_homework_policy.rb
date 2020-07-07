class FlashcardHomeworkPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    record.group.teacher.user == user
  end

  def create?
    true
  end

  def update?
    record.group.teacher.user == user
  end

  def destroy?
    record.group.teacher.user == user
  end
end
