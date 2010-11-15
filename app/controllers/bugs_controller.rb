class BugsController < ApplicationController
  before_filter :login_required
  # GET /bugs
  # GET /bugs.xml
  def index
    @bugs = Bug.paginate :page => params[:page], :order => 'created_at DESC'
    @bug = Bug.new


  end

  def search
    sql = "select * from bugs where 1=1 "

    if !params[:bug][:id].blank?
      sql += " and id=" + params[:bug][:id].to_s
    end

    unless params[:bug][:keyword].blank?
      sql += " and keyword='" + params[:bug][:keyword].to_s + "' "
    end

    unless params[:bug][:title].blank?
      sql += " and title='" + params[:bug][:title].to_s + "' "
    end

    if !params[:startTime].blank? && !params[:endTime].blank?
      sql +=" and created_at between DATE('" + params[:startTime].to_s + "') and DATE('" + params[:endTime] + "') "
    elsif !params[:startTime].blank?
      sql +=" and created_at > DATE('" + params[:startTime].to_s + "')"
    elsif !params[:endTime].blank?
      sql +=" and created_at < DATE('" + params[:endTime].to_s + "')"
    end

    @bugs = Bug.paginate_by_sql sql, :page=>params[:page], :order=>'create_at DESC'
    @bug = Bug.new

    render "bugs/index"
  end

  # GET /bugs/1
  # GET /bugs/1.xml
  def show
    @bug = Bug.find(params[:id])
    @severities = Severity.all
    @frequencies = Frequency.all
    @units = Unit.all
    @state = State.all
    respond_to do |format|
      format.html # show.html.erb
      format.xml { render :xml => @bug }
    end
  end

  # GET /bugs/new
  # GET /bugs/new.xml
  def new
    @bug = Bug.new
    @severities = Severity.all
    @frequencies = Frequency.all
    @units = Unit.all
    @state = State.all

    respond_to do |format|
      format.html # new.html.erb
      format.xml { render :xml => @bug }
    end
  end

  # GET /bugs/1/edit
  def edit
    @bug = Bug.find(params[:id])
    @severities = Severity.all
    @frequencies = Frequency.all
    @units = Unit.all
    @state = State.all
  end

  # POST /bugs
  # POST /bugs.xml
  def create
    @bug = Bug.new(params[:bug])
    @bug.user_id = logged_in_user.id


    respond_to do |format|
      if @bug.save
        format.html { redirect_to(@bug, :notice => 'Bug was successfully created.') }
        format.xml { render :xml => @bug, :status => :created, :location => @bug }
      else
        format.html { render :action => "new" }
        format.xml { render :xml => @bug.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /bugs/1
  # PUT /bugs/1.xml
  def update
    @bug = Bug.find(params[:id])

    respond_to do |format|
      if @bug.update_attributes(params[:bug])
        format.html { redirect_to(@bug, :notice => 'Bug was successfully updated.') }
        format.xml { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml { render :xml => @bug.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /bugs/1
  # DELETE /bugs/1.xml
  def destroy
    @bug = Bug.find(params[:id])
    @bug.destroy

    respond_to do |format|
      format.html { redirect_to(bugs_url) }
      format.xml { head :ok }
    end
  end

  def sort
    if !params[:id].blank? && params[:id].to_s == 'id'
      @bugs = Bug.paginate :page => params[:page], :order => 'id DESC'
    elsif !params[:id].blank? && params[:id].to_s == 'title'
      @bugs = Bug.paginate :page => params[:page], :order => 'title DESC'
    end
    @bug = Bug.new
    render "bugs/index"
  end
end
