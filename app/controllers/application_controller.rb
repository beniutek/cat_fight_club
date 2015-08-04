class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  #rescue_from ActiveRecord::RecordNotFound, :with => :rescue404
  #rescue_from ActionController::RoutingError, :with => :rescue404

  def rescue_404
  	render plain: "this cat does not exist"
  end
end
