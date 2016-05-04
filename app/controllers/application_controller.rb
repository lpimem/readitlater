class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # this is a small note change
  protect_from_forgery with: :exception

  rescue_from ActiveRecord::RecordNotFound do |exception|
    render status: 404 # nothing, redirect or a template
  end
end
