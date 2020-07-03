class RegistrationsController < Devise::RegistrationsController
  def create

    # if params[:teacher] == 'true'
    #   resource.create_teacher(first_name: params[:first_name], last_name: params[:last_name])
    #   raise
    # else
    #   resource.create_student(first_name: params[:first_name], last_name: params[:last_name])
    #   raise
    # end
    super
  end
end
