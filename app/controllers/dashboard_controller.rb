class DashboardController < ApplicationController
  def index
   @events = Event.find_all_by_user_id(current_user.id)
  end

end
