class TasksController < ApplicationController
  def index
    @user = User.find(params[:id])
    @task = Task.find(params[:user_id])
  end
end
