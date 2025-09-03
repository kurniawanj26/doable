class ProjectsController < ApplicationController
  def index
    # get all data from Project in the database
    # assign it to the @projects variable
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
  end
end
