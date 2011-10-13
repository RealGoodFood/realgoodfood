class DashboardsController < ApplicationController
  def index
   @my_listings = Listing.find_all_by_user_id(current_user)
  end

end
