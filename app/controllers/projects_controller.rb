class ProjectsController < ApplicationController
  before_action :set_project, only: %i[show edit update destroy vote_project]
  def index
    @projects = Project.all.order(created_at: :desc)
    @project = Project.new
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    respond_to do |format|
      if @project.save
        format.html { redirect_to projects_path, notice: 'Project was successfully created.' }
      else
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace(@project, partial: 'projects/form', locals: { project: @project })
        end
      end
    end
  end

  def edit; end

  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to projects_path, notice: 'Project was successfully updated.' }
      else
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace(@project, partial: 'projects/form', locals: { project: @project })
        end
      end
    end
  end

  def destroy
    @project.destroy
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: [
          turbo_stream.remove(@project),
          turbo_stream.update('notice', "Project #{@project.title} deleted")
        ]
      end
    end
  end

  def vote_project
    @project.increment! :vote
    redirect_to @project
  end

  private

  def set_project
    @project = Project.find_by_id(params[:id])
  end

  def project_params
    params.require(:project).permit(:title, :content, :vote)
  end
end
