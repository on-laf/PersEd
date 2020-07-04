class QuizQuestionPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(teacher: current_teacher)
    end
  end

  def index?
    true
  end

  def show?
    true
  end

  def create?
    true
  end

  def update?
    record.teacher == user.teacher
  end

  def destroy?
    record.teacher == user.teacher
  end
end
