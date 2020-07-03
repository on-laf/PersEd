class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  helper_method :current_teacher, :current_student, :teacher?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:teacher?])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:teacher?])
  end

  include Pundit

  # Pundit: white-list approach.
  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  # Uncomment when you *really understand* Pundit!
  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  # def user_not_authorized
  #   flash[:alert] = "You are not authorized to perform this action."
  #   redirect_to(root_path)
  # end

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end

  def current_teacher
    current_user&.teacher
  end

  def current_student
    current_user&.student
  end

  def teacher?
    current_teacher.present?
  end

  def after_sign_in_path_for(user)
     if params[:teacher] == 'true'
      resource.create_teacher(first_name: params[:first_name], last_name: params[:last_name])
      raise
    else
      resource.create_student(first_name: params[:first_name], last_name: params[:last_name])
      raise
    end
        if params[:teacher] == 'true'
      resource.create_teacher(first_name: params[:first_name], last_name: params[:last_name])
          teacher_path(user.teacher)
        else
          student_path(user.student)
        end
  end
end
