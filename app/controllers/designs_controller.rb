class DesignsController < ApplicationController
  # GET /designs
  # GET /designs.xml
  def index
    @designs = Design.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @designs }
    end
  end

  # GET /designs/1
  # GET /designs/1.xml
  def show
    @design = Design.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @design }
    end
  end

  # GET /designs/new
  # GET /designs/new.xml
  def new
    @design = Design.new
    @user = User.all
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @design }
    end
  end

  # GET /designs/1/edit
  def edit
    @design = Design.find(params[:id])
  end

  # POST /designs
  # POST /designs.xml
  def create
    @design = Design.new(params[:design])

    respond_to do |format|
      if @design.save
        format.html { redirect_to(@design, :notice => 'Design was successfully created.') }
        format.xml  { render :xml => @design, :status => :created, :location => @design }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @design.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /designs/1
  # PUT /designs/1.xml
  def update
    @design = Design.find(params[:id])

    respond_to do |format|
      if @design.update_attributes(params[:design])
        format.html { redirect_to(@design, :notice => 'Design was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @design.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /designs/1
  # DELETE /designs/1.xml
  def destroy
    @design = Design.find(params[:id])
    @design.destroy

    respond_to do |format|
      format.html { redirect_to(designs_url) }
      format.xml  { head :ok }
    end
  end
end
