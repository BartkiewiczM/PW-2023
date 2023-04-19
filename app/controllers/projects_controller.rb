class ProjectsController < ApplicationController
  def index
    @projects = Project.where(author_id: current_user.id)
  end

  def create
    @project = current_user.projects.build(project_params)
    respond_to do |format|
      if @project.save
        redirect_to projects_path, notice: "Project was successfully created."
      else
        format.turbo_stream { render turbo_stream: turbo_stream.replace("new_project", render_to_string(partial: "projects/new_project_form", locals: { project: @project })) }
        format.html do
          @projects = Project.where(author_id: current_user.id)
          render :index
        end
      end
    end
  end


  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to projects_path, notice: "Project was successfully destroyed."
  end

  private

  def project_params
    params.require(:project).permit(:name) # Add any additional fields here
  end
end
