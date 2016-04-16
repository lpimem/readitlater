class StaticPagesController < ApplicationController
  # helper_method :resource_name, :resource, :devise_mapping

  def home
  	    @links = Link.all
  end
end