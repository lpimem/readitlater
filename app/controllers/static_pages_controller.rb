class StaticPagesController < ApplicationController
  # helper_method :resource_name, :resource, :devise_mapping

  def home
  	    redirect_to links_url
  end

  def profile

  end

end
