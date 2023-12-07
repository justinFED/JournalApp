class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @categories = current_user.categories
    @tasks = current_user.tasks
  end

  def new
    @task = current_user.tasks.new
  end

  def create
    @task = current_user.tasks.build(task_params)
  
    if @task.save
      redirect_to tasks_path, notice: 'Task was successfully created.'
    else
      render :new
    end
  end
  
    def show
    end
  
    def edit
    end
  
    def update
      if @task.update(task_params)
        redirect_to tasks_path, notice: 'Task was successfully updated.'
      else
        render :edit
      end
    end
  
    def destroy
      category = @task.category
      @task.destroy
  
      redirect_to tasks_path, notice: 'Task was successfully destroyed.'
  
    end
  
    def view_today
      @tasks_today = Task.view_tasks_for_today(current_user)
    end
  
    private
  
    def set_task
      @task = current_user.tasks.find(params[:id])
    end
  
    def task_params
      params.require(:task).permit(:name, :category_id)
    end
  end
  