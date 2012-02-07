class MemberAttendingEventRegistersController < ApplicationController
  # GET /member_attending_event_registers
  # GET /member_attending_event_registers.xml
  def index
    @member_attending_event_registers = MemberAttendingEventRegister.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @member_attending_event_registers }
    end
  end

  # GET /member_attending_event_registers/1
  # GET /member_attending_event_registers/1.xml
  def show
    @member_attending_event_register = MemberAttendingEventRegister.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @member_attending_event_register }
    end
  end

  # GET /member_attending_event_registers/new
  # GET /member_attending_event_registers/new.xml
  def new
    @member_attending_event_register = MemberAttendingEventRegister.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @member_attending_event_register }
    end
  end

  # GET /member_attending_event_registers/1/edit
  def edit
    @member_attending_event_register = MemberAttendingEventRegister.find(params[:id])
  end

  # POST /member_attending_event_registers
  # POST /member_attending_event_registers.xml
  def create
    @member_attending_event_register = MemberAttendingEventRegister.new(params[:member_attending_event_register])

    respond_to do |format|
      if @member_attending_event_register.save
        format.html { redirect_to(@member_attending_event_register, :notice => 'Member attending event register was successfully created.') }
        format.xml  { render :xml => @member_attending_event_register, :status => :created, :location => @member_attending_event_register }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @member_attending_event_register.errors, :status => :unprocessable_entity }
      end
    end
  end


  def accept
    @event_accept = MemberAttendingEventRegister.find(params[@member_attending_event_register.id])

    @event_accept.accept!
    respond_to do |format|
       if @event_accept.update_attributes(params[:member_attending_event_register])
         format.html { redirect_to @event_accept, notice: 'Status was successfully updated.' }
         format.json { head :ok }
       else
         format.html { render action: "edit" }
         format.json { render json: @event_accept.errors, status: :unprocessable_entity }
       end
     end
  end

  def reject
    @event_reject = MemberAttendingEventRegister.find(params[:member_attending_event_register_id])

    @event_reject.reject!
    respond_to do |format|
       if @event_reject.update_attributes(params[:member_attending_event_register])
         format.html { redirect_to @event_reject, notice: 'Status was successfully updated.' }
         format.json { head :ok }
       else
         format.html { render action: "edit" }
         format.json { render json: @event_reject.errors, status: :unprocessable_entity }
       end
     end
  end


  # PUT /member_attending_event_registers/1
  # PUT /member_attending_event_registers/1.xml
  def update
    @member_attending_event_register = MemberAttendingEventRegister.find(params[:id])

    respond_to do |format|
      if @member_attending_event_register.update_attributes(params[:member_attending_event_register])
        format.html { redirect_to(@member_attending_event_register, :notice => 'Member attending event register was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @member_attending_event_register.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /member_attending_event_registers/1
  # DELETE /member_attending_event_registers/1.xml
  def destroy
    @member_attending_event_register = MemberAttendingEventRegister.find(params[:id])
    @member_attending_event_register.destroy

    respond_to do |format|
      format.html { redirect_to(member_attending_event_registers_url) }
      format.xml  { head :ok }
    end
  end
end
