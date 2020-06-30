class RegistrationsController < Devise::RegistrationsController
  def create
    super
    if params[:teacher]
      resource.create_teacher(first_name: params[:first_name], last_name: params[:last_name])
    else
      resource.create_student(first_name: params[:first_name], last_name: params[:last_name])
    end
  end
end
