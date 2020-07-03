class RegistrationsController < Devise::RegistrationsController
   def create
    build_resource(sign_up_params)
    resource.save
    yield resource if block_given?
    if resource.persisted?
      build_connection
      if resource.active_for_authentication?
        set_flash_message! :notice, :signed_up
        sign_up(resource_name, resource)
        respond_with resource, location: after_sign_up_path_for(resource)
      else
        set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      set_minimum_password_length
      respond_with resource
    end
  end
  private
  def build_connection
    if params[:teacher] == 'true'
      resource.create_teacher(first_name: params[:first_name], last_name: params[:last_name])
    else
      resource.create_student(first_name: params[:first_name], last_name: params[:last_name])
    end
  end
end
