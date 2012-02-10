class EventsController < ApplicationController
before_filter :authenticate_user!
  # GET /events
  # GET /events.xml
  def index
    @events = Event.all
    @json   = Event.all.to_gmaps4rails
    @event  = Event.paginate(:page => params[:page], :per_page => 30)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @events }
    end
  end

  # GET/List of attending users the event
  def event_attendence
    @event = Event.find(params[:event_id])
    @e = @event.member_attending_event_registers.build(:user_id => current_user.id, :event_id => "#{@event.id}",:owner_id => "#{@event.user_id}" )

    respond_to do |format|
      if @e.save
         @total_attendence = MemberAttendingEventRegister.find("#{@e.id}").event.update_attributes(:no_of_guests_attending => (@event.no_of_guests_attending)+1)
        format.html { redirect_to(@event, :notice => 'Request has been sent to the event owner.') }
        format.xml  { head :ok }
      else
        format.html { redirect_to(events_path, :notice => 'Something has gone wrong , please try again.') }
        format.xml  { render :xml => @event.errors, :status => :unprocessable_entity }
      end
    end
  end



  # GET /events/1
  # GET /events/1.xml
  def show
    @event = Event.find(params[:id])
    @json = Event.find(params[:id]).to_gmaps4rails

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @event }
    end
  end

  # GET /events/new
  # GET /events/new.xml
  def new
    @event = Event.new
    @latest_event = Event.where(:created_at => 1.days.ago .. 1.days.from_now)
  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
  end

  # POST /events
  # POST /events.xml
  def create
    @event = Event.new(params[:event])

    respond_to do |format|
      if @event.save
        format.html { redirect_to(@event, :notice => 'Event was successfully created.') }
        format.xml  { render :xml => @event, :status => :created, :location => @event }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @event.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /events/1
  # PUT /events/1.xml
  def update
    @event = Event.find(params[:id])

    respond_to do |format|
      if @event.update_attributes(params[:event])
        format.html { redirect_to(@event, :notice => 'Event was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @event.errors, :status => :unprocessable_entity }
      end
    end
  end


def update_events
   render :update do |page|
    #page.replace_html 'form',   :partial => 'products',   :object => products
     page.replace_html'swap' ,   :partial => 'swap'
   end
end

  # DELETE /events/1
  # DELETE /events/1.xml
  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to(events_url) }
      format.xml  { head :ok }
    end
  end
end
