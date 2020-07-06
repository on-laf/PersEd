class FlashcardHomeworkPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where('group.teacher' => current_teacher)
    end
  end

  def index?
    true
  end

  def show?
    record.group.teacher.user = user
  end

  def create?
    true
  end

  def update?
    record.group.teacher.user = user
  end

  def destroy?
    record.group.teacher.user = user
  end
end
