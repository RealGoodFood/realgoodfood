class EatByDatesController < ApplicationController
before_filter :authenticate_user!
  # GET /eat_by_dates
  # GET /eat_by_dates.xml
  def index
    @eat_by_dates = EatByDate.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @eat_by_dates }
    end
  end

  # GET /eat_by_dates/1
  # GET /eat_by_dates/1.xml
  def show
    @eat_by_date = EatByDate.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @eat_by_date }
    end
  end

  # GET /eat_by_dates/new
  # GET /eat_by_dates/new.xml
  def new
    @eat_by_date = EatByDate.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @eat_by_date }
    end
  end

  # GET /eat_by_dates/1/edit
  def edit
    @eat_by_date = EatByDate.find(params[:id])
  end

  # POST /eat_by_dates
  # POST /eat_by_dates.xml
  def create
    @eat_by_date = EatByDate.new(params[:eat_by_date])

    respond_to do |format|
      if @eat_by_date.save
        format.html { redirect_to(@eat_by_date, :notice => 'Eat by date was successfully created.') }
        format.xml  { render :xml => @eat_by_date, :status => :created, :location => @eat_by_date }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @eat_by_date.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /eat_by_dates/1
  # PUT /eat_by_dates/1.xml
  def update
    @eat_by_date = EatByDate.find(params[:id])

    respond_to do |format|
      if @eat_by_date.update_attributes(params[:eat_by_date])
        format.html { redirect_to(@eat_by_date, :notice => 'Eat by date was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @eat_by_date.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /eat_by_dates/1
  # DELETE /eat_by_dates/1.xml
  def destroy
    @eat_by_date = EatByDate.find(params[:id])
    @eat_by_date.destroy

    respond_to do |format|
      format.html { redirect_to(eat_by_dates_url) }
      format.xml  { head :ok }
    end
  end
end
