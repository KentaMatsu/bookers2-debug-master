class ApplicationController < ActionController::Base

	before_action :configure_permitted_parameters, if: :devise_controller?


  def autheniticate_user
    if @current_user==nil
      redirect_to("/login")
    end
  end


  protected
  def after_sign_in_path_for(resource)
    user_path(current_user)
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end



end
