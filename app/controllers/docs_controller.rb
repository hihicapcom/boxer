class DocsController < ApplicationController
  @@storage_path = "#{RAILS_ROOT}/files"

  # GET /docs
  # GET /docs.xml
  def index
    @docs = Doc.all
    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @docs }
    end
  end

  def upload
    if request.post?
      file = params[:attachments]['1']['file']
      Doc.create(:file => file);
    end
    redirect_to(:action => :index)
  end

  def download

    if !params[:id].blank?
      doc = Doc.find(params[:id])
      send_file @@storage_path +"/"+ doc.filename
    end

  end

  # GET /docs/1
  # GET /docs/1.xml
  def show
    @doc = Doc.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml { render :xml => @doc }
    end
  end

  # GET /docs/new
  # GET /docs/new.xml
  def new
    @doc = Doc.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml { render :xml => @doc }
    end
  end

  # GET /docs/1/edit
  def edit
    @doc = Doc.find(params[:id])
  end

  # POST /docs
  # POST /docs.xml
  def create
    @doc = Doc.new(params[:doc])

    respond_to do |format|
      if @doc.save
        format.html { redirect_to(@doc, :notice => 'Doc was successfully created.') }
        format.xml { render :xml => @doc, :status => :created, :location => @doc }
      else
        format.html { render :action => "new" }
        format.xml { render :xml => @doc.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /docs/1
  # PUT /docs/1.xml
  def update
    @doc = Doc.find(params[:id])

    respond_to do |format|
      if @doc.update_attributes(params[:doc])
        format.html { redirect_to(@doc, :notice => 'Doc was successfully updated.') }
        format.xml { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml { render :xml => @doc.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /docs/1
  # DELETE /docs/1.xml
  def destroy
    @doc = Doc.find(params[:id])
    @doc.destroy

    respond_to do |format|
      format.html { redirect_to(docs_url) }
      format.xml { head :ok }
    end
  end
end
