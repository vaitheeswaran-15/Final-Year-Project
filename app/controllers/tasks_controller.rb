class TasksController < ApplicationController
  before_action :set_project
  before_action :set_task, only: %i[ show edit update destroy ]

  # GET /tasks or /tasks.json
  def index
    @tasks = @project.tasks
  end

  # GET /tasks/1 or /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    @task = @project.tasks.build
    @teams = Team.includes(:users).all
    @users = []
    @teams.each do |team|
      team.users.each do |team_user|
        @users << team_user.email+"("+team.name+")"
      end
    end
  end

  # GET /tasks/1/edit
  def edit
    @teams = Team.includes(:users).all
    @users = []
    @teams.each do |team|
      team.users.each do |team_user|
        @users << team_user.email+"("+team.name+")"
      end
    end
  end



  # POST /tasks or /tasks.json
  def create
    @task = @project.tasks.build(task_params)
    respond_to do |format|
      if @task.save
        format.html { redirect_to project_path(@project), notice: "Task was successfully created." }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1 or /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to project_tasks_path(@project), notice: "Task was successfully updated." }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1 or /tasks/1.json
  def destroy
    @task.destroy

    respond_to do |format|
      format.html { redirect_to project_tasks_path(@project), notice: "Task was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def notify_developers
    puts "Request Received with project ID #{params}"
    @project.tasks.all.each do |task|
      user = task.assigned_user.split('(')[0]
      if (task.updated_at + task.estimation.hour < Time.now.utc) and (current_user.email == user) and (task.status != 'COMPLETED')
        Task.send_notification(task)
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:project_id])
    end

    def set_task
      @task = @project.tasks.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def task_params
      params.require(:task).permit(:title, :description, :estimation, :status, :assigned_user, :project_id)
    end

end
