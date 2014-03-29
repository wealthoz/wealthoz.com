class ProjectsController < ApplicationController
    before_action :signed_in_user

  def edit
    @project = Project.find(params[:id])
  end
  
  def show
     @Projects = Projects.all.by_name
  end

  def new
      @project = Project.new
     
  end
    
  def create
    @project = current_user.projects.build(project_params)
    if @project.save
      flash[:success] = "A new Project was created!"
      redirect_to root_url
    else
      render 'projects/new'
    end
  end

  
  def update
  end

  def destroy
  end

  def correct_user
      @project = current_user.projectss.find_by(id: params[:id])
      redirect_to root_url if @project.nil?
  end
  

  private

    def project_params
      params.require(:project).permit(:name,:id, :email,:percent_owned)
    end


end


