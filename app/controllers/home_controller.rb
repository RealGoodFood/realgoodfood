class HomeController < ApplicationController
  def index
    @json   = Event.find(:all).to_gmaps4rails
    @event  = Event.paginate(:page => params[:page], :per_page => 3)
  end

end