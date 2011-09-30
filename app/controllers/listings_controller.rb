class ListingsController < ApplicationController
 before_filter :authenticate_user!
  autocomplete :food_category, :name
# autocomplete :food_category, :name, :full => true

 #autocomplete :food_category, :name do |items|
  #   CustomJSON::Encoder.encode(items)
 #end

  # GET /listings
  # GET /listings.xml
  def index
   @listings = Listing.paginate(:page => params[:page], :per_page => 5)
   @json = Listing.find(:all).to_gmaps4rails
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @listings }
    end
  end

  # GET /listings/1
  # GET /listings/1.xml
  def show
    @listing = Listing.find(params[:id])
    @comment = Comment.new(:listing =>@listing)
    @tags = Listing.tag_counts_on(:tags)
    @search  = @listing.location_id
    @search_listing = Listing.find_by_sql("select title from listings where location_id = '#{@search}'")
 logger.info "Sudhir %&%&%"+@search_listing.inspect 
   @json = Listing.find(params[:id]).to_gmaps4rails
   # @start_date = @listing.start_date
    #@end_date  = @listing.end_date
    #@total_days = @end_date -Date.today().to_s 
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @listing }
    end
  end 

  # GET /listings/new
  # GET /listings/new.xml
  def new
    @listing = Listing.new
    @values = Value.all

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @listing }
    end
  end


def search 
    @listing = Listing.find(params[:id])
    @search  = @listing.location_id
    #@search_listing = Listing.find_by_sql("select * from listings where location_id = '#{@search}'")
 logger.info "Sudhir %&%&%"+@search_listing.inspect 
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @listing }
    end
  end


  # GET /listings/1/edit
  def edit
    @listing = Listing.find(params[:id])
    @values = Value.find(:all)
  end

  # POST /listings
  # POST /listings.xml
  def create
    @listing = Listing.new(params[:listing])

    respond_to do |format|
      if @listing.save
        format.html { redirect_to(@listing, :notice => 'Listing was successfully created.') }
        format.xml  { render :xml => @listing, :status => :created, :location => @listing }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @listing.errors, :status => :unprocessable_entity }
      end
    end
  end

#tag cloud

   def tag_cloud
     @tags = Listing.tag_counts_on(:tags)
        logger.info "Tags===> " +@tags.inspect
      #@tags = Listing.tagged_with(params[:id]).page(params[:page])
     # @tags = Listing.tag_counts_on(:tags)
   end

  # PUT /listings/1
  # PUT /listings/1.xml
  def update
    @listing = Listing.find(params[:id])

    respond_to do |format|
      if @listing.update_attributes(params[:listing])
        format.html { redirect_to(@listing, :notice => 'Listing was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @listing.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /listings/1
  # DELETE /listings/1.xml
  def destroy
    @listing = Listing.find(params[:id])
    @listing.destroy

    respond_to do |format|
      format.html { redirect_to(listings_url) }
      format.xml  { head :ok }
    end
  end
end
