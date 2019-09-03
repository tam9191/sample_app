class TasksController < ApplicationController
  before_action :set_user
  
  def index
    @task = @user.tasks
  end
  
  def show
  end
  
  def new
    @task = Task.new
  end
  
  def create
     @task = @user.tasks.build(task_params)
    if @task.save
      flash[:success] = "タスクを新規作成しました。"
      redirect_to user_tasks_url @user
    else
      render :new
    end
  end
  
  private
  
    def set_user
      @user = User.find(params[:id])
    end
end
