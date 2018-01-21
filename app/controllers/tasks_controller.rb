class TasksController < ApplicationController

  def create
    result = TasksService.new.get_result(task_params)
    if result
      render json: { result: result }
    else
      render json: { error: 'Invalid parameters' }
    end
  end

  private

  def task_params
    params.permit(:a, :b, :c, :d).to_h
  end
end
