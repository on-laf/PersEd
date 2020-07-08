class StudentFlashcardSetPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(student: current_student)
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
    record.flashcard_homework.group.teacher.user == user
  end

  def destroy?
    record.flashcard_homework.group.teacher.user == user
  end

  def flop_submit?
    record.student.user == user
  end
end
