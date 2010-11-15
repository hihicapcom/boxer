class ModulesController < ApplicationController
  # GET /modules
  # GET /modules.xml
  def index
    @modules = Module.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @modules }
    end
  end

  # GET /modules/1
  # GET /modules/1.xml
  def show
    @module = Module.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @module }
    end
  end

  # GET /modules/new
  # GET /modules/new.xml
  def new
    @module = Module.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @module }
    end
  end

  # GET /modules/1/edit
  def edit
    @module = Module.find(params[:id])
  end

  # POST /modules
  # POST /modules.xml
  def create
    @module = Module.new(params[:module])

    respond_to do |format|
      if @module.save
        format.html { redirect_to(@module, :notice => 'Module was successfully created.') }
        format.xml  { render :xml => @module, :status => :created, :location => @module }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @module.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /modules/1
  # PUT /modules/1.xml
  def update
    @module = Module.find(params[:id])

    respond_to do |format|
      if @module.update_attributes(params[:module])
        format.html { redirect_to(@module, :notice => 'Module was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @module.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /modules/1
  # DELETE /modules/1.xml
  def destroy
    @module = Module.find(params[:id])
    @module.destroy

    respond_to do |format|
      format.html { redirect_to(modules_url) }
      format.xml  { head :ok }
    end
  end
end
