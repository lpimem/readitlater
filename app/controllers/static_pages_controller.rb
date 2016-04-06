class StaticPagesController < ApplicationController
  def home
  	    @links = Link.all
  end
end