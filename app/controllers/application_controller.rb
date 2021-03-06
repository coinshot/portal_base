class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  after_filter :save_location

  layout :layout_by_resource

  def save_location
    # store last url - this is needed for post-login redirect to whatever the user last visited.
    session[:previous_url] = request.fullpath if (request.fullpath != "/users/sign_in" && request.fullpath != "/users/sign_up" && request.fullpath != "/users/password" && request.fullpath != "/users/sign_out" && !request.xhr?) # don't store ajax calls
  end

  def after_sign_in_path_for(resource)
    session[:previous_url] || root_path
  end

  protected

  def layout_by_resource
    if devise_controller?
      "devise"
    else
      "application"
    end
  end
end
