class ImplementsController < ApplicationController
  # GET /implements
  # GET /implements.xml
  def index
    @implements = Implement.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @implements }
    end
  end

  # GET /implements/1
  # GET /implements/1.xml
  def show
    @implement = Implement.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @implement }
    end
  end

  # GET /implements/new
  # GET /implements/new.xml
  def new
    @implement = Implement.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @implement }
    end
  end

  # GET /implements/1/edit
  def edit
    @implement = Implement.find(params[:id])
  end

  # POST /implements
  # POST /implements.xml
  def create
    @implement = Implement.new(params[:implement])

    respond_to do |format|
      if @implement.save
        format.html { redirect_to(@implement, :notice => 'Implement was successfully created.') }
        format.xml  { render :xml => @implement, :status => :created, :location => @implement }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @implement.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /implements/1
  # PUT /implements/1.xml
  def update
    @implement = Implement.find(params[:id])

    respond_to do |format|
      if @implement.update_attributes(params[:implement])
        format.html { redirect_to(@implement, :notice => 'Implement was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @implement.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /implements/1
  # DELETE /implements/1.xml
  def destroy
    @implement = Implement.find(params[:id])
    @implement.destroy

    respond_to do |format|
      format.html { redirect_to(implements_url) }
      format.xml  { head :ok }
    end
  end
end
