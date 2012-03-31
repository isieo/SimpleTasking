class ChecklistsController < ApplicationController
  before_filter :authenticate_user!

  # GET /checklists
  # GET /checklists.json
  def index
    @checklists = Checklist.viewable_for(current_user).all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @checklists }
    end
  end

  # GET /checklists/1
  # GET /checklists/1.json
  def show
    @checklist = Checklist.find(params[:id])
    @checklist.columns.create(:name=>"Untitled Column") if @checklist.columns.length == 0
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @checklist }
    end
  end

  # GET /checklists/new
  # GET /checklists/new.json
  def new
    @checklist = Checklist.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @checklist }
    end
  end

  # GET /checklists/1/edit
  def edit
    @checklist = Checklist.find(params[:id])
  end

  # POST /checklists
  # POST /checklists.json
  def create
    @checklist = Checklist.new(params[:checklist])
    @checklist.user = current_user
    respond_to do |format|
      if @checklist.save
        format.html { redirect_to @checklist, notice: 'Checklist was successfully created.' }
        format.json { render json: @checklist, status: :created, location: @checklist }
      else
        format.html { render action: "new" }
        format.json { render json: @checklist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /checklists/1
  # PUT /checklists/1.json
  def update
    @checklist = Checklist.find(params[:id])

    respond_to do |format|
      if @checklist.update_attributes(params[:checklist])
        format.html { redirect_to @checklist, notice: 'Checklist was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @checklist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /checklists/1
  # DELETE /checklists/1.json
  def destroy
    @checklist = Checklist.find(params[:id])
    @checklist.destroy

    respond_to do |format|
      format.html { redirect_to checklists_url }
      format.json { head :no_content }
    end
  end

  def create_task
    @checklist = Checklist.find(params[:checklist_id])
    @checklist.tasks.create(name: "New Task", description: "Description for task")
    redirect_to checklist_path(@checklist)
  end

  def create_column
    @checklist = Checklist.find(params[:checklist_id])
    @checklist.columns.create(name: "New Column", user_id: current_user.id)
    redirect_to checklist_path(@checklist)
  end
end
