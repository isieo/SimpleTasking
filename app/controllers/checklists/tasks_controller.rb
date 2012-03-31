class Checklists::TasksController < ApplicationController
  before_filter :load_checklist
  # GET /checklists/tasks
  # GET /checklists/tasks.json
  def index
    @checklists_tasks = Checklists::Task.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @checklists_tasks }
    end
  end

  # GET /checklists/tasks/1
  # GET /checklists/tasks/1.json
  def show
    @checklists_task = Checklists::Task.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @checklists_task }
    end
  end

  # GET /checklists/tasks/new
  # GET /checklists/tasks/new.json
  def new
    @task = Checklists::Task.new

    respond_to do |format|
      format.html # new.html.erb
      format.text { render :partial=>'form',layout: false }
      format.json { render json: @task }
    end
  end

  # GET /checklists/tasks/1/edit
  def edit
    @checklists_task = Checklists::Task.find(params[:id])
  end

  # POST /checklists/tasks
  # POST /checklists/tasks.json
  def create
    @checklists_task = Checklists::Task.new(params[:checklists_task])

    respond_to do |format|
      if @checklists_task.save
        format.html { redirect_to @checklists_task, notice: 'Task was successfully created.' }
        format.json { render json: @checklists_task, status: :created, location: @checklists_task }
      else
        format.html { render action: "new" }
        format.json { render json: @checklists_task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /checklists/tasks/1
  # PUT /checklists/tasks/1.json
  def update
    @checklists_task = Checklists::Task.find(params[:id])

    respond_to do |format|
      if @checklists_task.update_attributes(params[:checklists_task])
        format.html { redirect_to @checklists_task, notice: 'Task was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @checklists_task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /checklists/tasks/1
  # DELETE /checklists/tasks/1.json
  def destroy
    @checklists_task = Checklists::Task.find(params[:id])
    @checklists_task.destroy

    respond_to do |format|
      format.html { redirect_to checklists_tasks_url }
      format.json { head :no_content }
    end
  end

  private
  def load_checklist
    @checklist = Checklist.find(params[:checklist_id])
  end
end
