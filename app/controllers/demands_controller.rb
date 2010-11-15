class DemandsController < ApplicationController
  before_filter :login_required
  # GET /demands
  # GET /demands.xml
  def index
    @demands = Demand.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @demands }
    end
  end

  # GET /demands/1
  # GET /demands/1.xml
  def show
    @demand = Demand.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml { render :xml => @demand }
    end
  end

  # GET /demands/new
  # GET /demands/new.xml
  def new
    @demand = Demand.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml { render :xml => @demand }
    end
  end

  # GET /demands/1/edit
  def edit
    @demand = Demand.find(params[:id])
  end

  # POST /demands
  # POST /demands.xml
  def create
    @demand = Demand.new(params[:demand])
    @demand.user_id =logged_in_user.id
    respond_to do |format|
      if @demand.save
        format.html { redirect_to(@demand, :notice => 'Demand was successfully created.') }
        format.xml { render :xml => @demand, :status => :created, :location => @demand }
      else
        format.html { render :action => "new" }
        format.xml { render :xml => @demand.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /demands/1
  # PUT /demands/1.xml
  def update
    @demand = Demand.find(params[:id])

    respond_to do |format|
      if @demand.update_attributes(params[:demand])
        format.html { redirect_to(@demand, :notice => 'Demand was successfully updated.') }
        format.xml { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml { render :xml => @demand.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /demands/1
  # DELETE /demands/1.xml
  def destroy
    @demand = Demand.find(params[:id])
    @demand.destroy

    respond_to do |format|
      format.html { redirect_to(demands_url) }
      format.xml { head :ok }
    end
  end
end
