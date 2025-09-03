class ProjectsController < ApplicationController
  def index
    # get all data from Project in the database
    # assign it to the @projects variable
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      flash[:notice] = "Project created successfully"
      redirect_to project_path(@project)
    else
      # :unprocessable_entity = 422 status code
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @project = Project.find(params[:id])
  end
  
  def update
    @project = Project.find(params[:id])

    if @project.update(project_params)
      flash[:notice] = "Project updated successfully"
      redirect_to project_path(@project)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def project_params
    # look at inside of the project n only allow the name field to come through
    # a.k.a. strong parameter
    # built in safety feature, protect the app from unwanted / malicious data
    params.require(:project).permit(:name)
  end
end
