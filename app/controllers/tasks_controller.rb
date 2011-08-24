class TasksController < ApplicationController

  attr_accessor :completed
  before_filter :find_list
  respond_to :html, :xml, :js

   def create
     @list = List.find(params[:list_id])
     @task = @list.tasks.new(params[:task])
     if @task.save
       flash[:notice] = "Task created."
       redirect_to list_url(@list)
     else
       flash[:error] = "Could not add task at this time."
       redirect_to list_url(@list)
     end # if
   end # create

   def complete
     @list = List.find(params[:list_id])
     @task = @list.tasks.find(params[:id])
     @task.completed = true
     @task.save
     redirect_to list_url(@list)
   end # complete

   private
   def find_list
     @list = List.find(params[:list_id])
   end # find_list

end
