class TasksController < ApplicationController
  before_filter :login_required
  # GET /tasks
  # GET /tasks.xml
  def index
    @tasks = Task.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @tasks }
    end
  end

  # GET /tasks/1
  # GET /tasks/1.xml
  def show
    @task = Task.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml { render :xml => @task }
    end
  end

  # GET /tasks/new
  # GET /tasks/new.xml
  def new
    @task = Task.new
    @state = State.all
    @user = User.all

    unless params[:bug_id].blank?
      bug_id = params[:bug_id]
      @object = Bug.find(bug_id)
      @type = 'b'
    end

    unless params[:design_id].blank?
      design_id = params[:design_id]
      @object = Design.find(design_id)
      @type='d'
    end


    respond_to do |format|
      format.html # new.html.erb
      format.xml { render :xml => @task }
    end
  end

  # GET /tasks/1/edit
  def edit
    @task = Task.find(params[:id])
    @state = State.all
    @user = User.all
  end

  # POST /tasks
  # POST /tasks.xml
  def create
    @task = Task.new(params[:task])
    puts "xxxxxxxxxxxxxxxxxxxx" + params[:id].to_s
    unless params[:type].blank?
      if params[:type] == 'b'
        @task.bug = Bug.find(params[:id])
      elsif params[:type] == 'd'
        @task.design = Design.find(params[:id])
      end
    end

    respond_to do |format|
      if @task.save
        format.html { redirect_to(@task, :notice => 'Task was successfully created.') }
        format.xml { render :xml => @task, :status => :created, :location => @task }
      else
        format.html { render :action => "new" }
        format.xml { render :xml => @task.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tasks/1
  # PUT /tasks/1.xml
  def update
    @task = Task.find(params[:id])

    respond_to do |format|
      if @task.update_attributes(params[:task])
        format.html { redirect_to(@task, :notice => 'Task was successfully updated.') }
        format.xml { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml { render :xml => @task.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.xml
  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    respond_to do |format|
      format.html { redirect_to(tasks_url) }
      format.xml { head :ok }
    end
  end
end
