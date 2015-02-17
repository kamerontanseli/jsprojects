class PagesController < ApplicationController
  
  http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show, :new, :create]

  def index
    @projects = Project.all.order(:created_at).limit(12)
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
      redirect_to(:action => "index")
    else
      render("new")
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    if @project.update_attributes(project_params)
      redirect_to(:action => "show", :id => @project.id)
    else
      render("index")
    end
  end

  def delete
    @project = Project.find(params[:id])
  end

  def destroy
    Project.find(params[:id]).destroy
    redirect_to(:action => "index")
  end

  private
    def project_params
      params.require(:project).permit(:title, :desc, :img)
    end
end
