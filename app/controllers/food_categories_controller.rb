class FoodCategoriesController < ApplicationController
  # GET /food_categories
  # GET /food_categories.xml
  def index
    @food_categories = FoodCategory.all
    #@food_categories = FoodCategory.find(:all, :conditions => ['name LIKE ?', "%#{params[:search]}%"])

    respond_to do |format|
      format.js
      format.html # index.html.erb
      format.xml  { render :xml => @food_categories }
    end
  end

  # GET /food_categories/1
  # GET /food_categories/1.xml
  def show
    @food_category = FoodCategory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @food_category }
    end
  end

  # GET /food_categories/new
  # GET /food_categories/new.xml
  def new
    @food_category = FoodCategory.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @food_category }
    end
  end

  # GET /food_categories/1/edit
  def edit
    @food_category = FoodCategory.find(params[:id])
  end

  # POST /food_categories
  # POST /food_categories.xml
  def create
    @food_category = FoodCategory.new(params[:food_category])

    respond_to do |format|
      if @food_category.save
        format.html { redirect_to(@food_category, :notice => 'Food category was successfully created.') }
        format.xml  { render :xml => @food_category, :status => :created, :location => @food_category }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @food_category.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /food_categories/1
  # PUT /food_categories/1.xml
  def update
    @food_category = FoodCategory.find(params[:id])

    respond_to do |format|
      if @food_category.update_attributes(params[:food_category])
        format.html { redirect_to(@food_category, :notice => 'Food category was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @food_category.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /food_categories/1
  # DELETE /food_categories/1.xml
  def destroy
    @food_category = FoodCategory.find(params[:id])
    @food_category.destroy

    respond_to do |format|
      format.html { redirect_to(food_categories_url) }
      format.xml  { head :ok }
    end
  end
end
