class FlashcardTemplatePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      # scope.where('user.teacher.subjects' => { subject: flashcard_template.topic.subject })
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
    record.teacher == user.teacher
  end

  def destroy?
    record.teacher == user.teacher
  end
end
