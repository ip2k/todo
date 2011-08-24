class ListsController < ApplicationController

  respond_to :html, :xml, :js

  def index
    respond_with(@lists = List.all)
  end # index

  def new
    @list = List.new
  end # new

  def create
    @list = List.new(params[:list])
    if @list.save
      flash[:notice] = "List created."
      respond_with(@list, :location => list_url(@list))
    else
      flash[:error] = "Could not create list."
      redirect_to new_list_url
    end
  end # create

  def show
    @list = List.find(params[:id])
    @task = @list.tasks.new
#    respond_with(@list = List.find(params[:id]))
  end # show

  def edit
    @list = List.find(params[:id])
  end # edit

  def update
    @list = List.find(params[:id])
    if @list.update_attributes(params[:list])
      flash[:notice] = "List updated."
      respond_with(@list, :location => list_url(@list))
    else
      flash[:error] = "Could not update list"
      redirect_to edit_list_path(@list)
    end # if list
  end # update

  def destroy
    @list = List.find(params[:id])
    if @list.destroy
      flash[:notice] = "List deleted."
      #redirect_to list_path(@list)
      redirect_to lists_url
    else
      flash[:error] = "Could not delete list.  Is it empty?"
      redirect_to lists_url
    end # if list
  end # destroy
end # class ListsController
