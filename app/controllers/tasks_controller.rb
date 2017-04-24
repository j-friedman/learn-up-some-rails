class TasksController < ApplicationController
  def show
    @task = Task.find params[:id]
  end

  def index
    @task = Task.new
    @tasks = Task.all.order 'is_done, priority IS NULL, priority'
  end

  def new
    @task = Task.new
  end

  def edit
    @task = Task.find params[:id]
  end

  def create
    @task = Task.new task_params

    if @task.save
      redirect_to tasks_path
    else
      render 'index'
    end
  end

  def update
    @task = Task.find params[:id]
    if @task.update task_params
      redirect_to @task
    else
      render 'edit'
    end
  end

  def destroy
    @task = Task.find params[:id]
    @task.destroy

    redirect_to tasks_path
  end

  private
  def task_params
    params.require(:task).permit :is_done, :name, :priority
  end
end
