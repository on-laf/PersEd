class StudentFlashcardPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
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
    record.student_flashcard_set.flashcard_homework.flashcard_set.teacher == user.teacher || record.student_flashcard_set.student.user == user
  end

  def destroy?
    record.student_flashcard_set.flashcard_homework.flashcard_set.teacher == user.teacher
  end

  def add_feedback?
    record.student_flashcard_set.flashcard_homework.flashcard_set.teacher == user.teacher
  end
end
