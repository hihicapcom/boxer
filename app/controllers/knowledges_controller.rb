class KnowledgesController < ApplicationController
  @@storage_path = "#{RAILS_ROOT}/files"
  # GET /knowledges
  # GET /knowledges.xml
  def index
    @knowledges = Knowledge.all
    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @knowledges }
    end
  end

  # GET /knowledges/1
  # GET /knowledges/1.xml
  def show
    @knowledge = Knowledge.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml { render :xml => @knowledge }
    end
  end

  def addfile
    if request.post?
      file = params[:attachments]['1']['file']
      Doc.create(:file => file);
    end
  end

  # GET /knowledges/new
  # GET /knowledges/new.xml
  def new
    @knowledge = Knowledge.new
    @docs = Doc.all
    respond_to do |format|
      format.html # new.html.erb
      format.xml { render :xml => @knowledge }
    end
  end

  # GET /knowledges/1/edit
  def edit
    @knowledge = Knowledge.find(params[:id])
  end

  def download

    if !params[:id].blank?
      doc = Doc.find(params[:id])
      send_file @@storage_path +"/"+ doc.filename
    end

  end

  # POST /knowledges
  # POST /knowledges.xml
  def create
    @knowledge = Knowledge.new(params[:knowledge])
    @knowledge.user_id = logged_in_user.id

    respond_to do |format|
      if @knowledge.save
        format.html { redirect_to(@knowledge, :notice => 'Knowledge was successfully created.') }
        format.xml { render :xml => @knowledge, :status => :created, :location => @knowledge }
      else
        format.html { render :action => "new" }
        format.xml { render :xml => @knowledge.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /knowledges/1
  # PUT /knowledges/1.xml
  def update
    @knowledge = Knowledge.find(params[:id])

    respond_to do |format|
      if @knowledge.update_attributes(params[:knowledge])
        format.html { redirect_to(@knowledge, :notice => 'Knowledge was successfully updated.') }
        format.xml { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml { render :xml => @knowledge.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /knowledges/1
  # DELETE /knowledges/1.xml
  def destroy
    @knowledge = Knowledge.find(params[:id])
    @knowledge.destroy

    respond_to do |format|
      format.html { redirect_to(knowledges_url) }
      format.xml { head :ok }
    end
  end
end
