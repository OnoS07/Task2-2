class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
      user_path(resource)
  end

  before_action :configure_permitted_parameters, if: :devise_controller?
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys:[:email])
  end

  protected
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  protected
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
