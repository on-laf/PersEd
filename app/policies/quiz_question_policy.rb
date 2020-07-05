class QuizQuestionPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
      # scope.where(user.teacher == current_teacher)
    end
  end

  def index?
    # returns all quiz questions need to change scope to topic ids.
    true
  end

  def show?
    # where quizcard_question = id
    true
  end

  def create?
    true
  end

# need to look at scope. do we stop allowing updates? or make every question belong to a teacher?
  def update?
    true
    # record.teacher == user.teacher
  end

  def destroy?
    true
    # record.teacher == user.teacher
  end
end
