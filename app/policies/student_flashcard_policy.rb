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
      record.flashcard_template.teacher == user.teacher
    end

    def destroy?
      record.flashcard_template.teacher == user.teacher
    end
  end
end
