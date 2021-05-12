class TasksController < ApplicationController
  before_action :set_task, only: %i[show edit update destroy]
  before_action :authenticate

  # GET /tasks or /tasks.json
  def index
    @tasks = if params[:ungrouped]
               current_user.ungrouped_tasks_from_user(current_user.id)
             else
               current_user.tasks.all
             end
    # puts 'Tasks'
  end

  # GET /tasks/1 or /tasks/1.json
  def show
    @task = Task.find(params[:id])
    @groups = @task.group.nil? ? nil : @task.group
  end

  # GET /tasks/new
  def new
    @task = Task.new
    @groups = Group.all
    @groups_array = create_groups_array
    @tasks_created = tasks_created
  end

  # GET /tasks/1/edit
  def edit; end

  # POST /tasks or /tasks.json
  def create
    @task = Task.new(task_params)
    @task.author_id = current_user.id

    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: 'Task was successfully created.' }
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
        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
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
      format.html { redirect_to tasks_url, notice: 'Task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def authenticate
    return if logged_in?

    flash[:alert] = 'You need to Sign In or register as a New User to continue'
    redirect_to '/log'
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_task
    @task = Task.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def task_params
    params.require(:task).permit(:name, :amount, :group_id)
  end

  def tasks_created
    Task.ascending.pluck(:name)
  end

  def create_groups_array
    arr = Group.all.pluck(:name, :id)
    arr.insert(0, ['No group', nil])
  end
end
