class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  
    def index
        @categories = Category.all
        @tasks = Task.all
    end
  
    def new
      @task = Task.new
    end
  
    def create
      @task = Task.new(task_params)
  
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
      @tasks_today = Task.view_tasks_for_today
    end
  
    private
  
    def set_task
      @task = Task.find(params[:id])
    end
  
    def task_params
      params.require(:task).permit(:name, :category_id)
    end
  end
  