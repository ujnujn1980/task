class TasklistsController < ApplicationController

  def index
    @tasklist = Tasklist.all
  end

  def new
    @tasklist = Tasklist.new
  end

  def create
    @tasklist = Tasklist.new(tasklist_params)
    @tasklist.save 
    to_index
  end

  def edit
    @tasklist = tasklist_of_id
  end

  def update
    @tasklist = tasklist_of_id
    @tasklist.update(tasklist_params)
    to_index
  end

  def destroy
    @tasklist = tasklist_of_id
    @tasklist.delete
    to_index
  end

  private
  def tasklist_params
    params.require(:tasklist).permit(:title, :text)
  end

  def to_index
    redirect_to tasklists_path
  end

  def tasklist_of_id
    Tasklist.find(params[:id])
  end

end
