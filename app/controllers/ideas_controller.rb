# app/controllers/ideas_controller.rb
class IdeasController < ApplicationController
  before_action :authenticate_user!

  def create
    @idea = Idea.new(idea_params)
    opportunity = Opportunity.find(params[:idea][:opportunity_id])
    @idea.project = opportunity.project

    if @idea.save
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js   # This will render create.js.erb
      end
    else
      render json: @idea.errors, status: :unprocessable_entity
    end
  end

  def new
    @idea = Idea.new
    @projects = current_user.projects.includes(:opportunities) # Fetch projects associated with the current user
  end

  def destroy
    @idea = Idea.find(params[:id])
    @idea.destroy

    respond_to do |format|
      format.turbo_stream
    end
  end

  private

  def idea_params
    params.require(:idea).permit(:name, :description, :comment, :attachment, :status, :link, :opportunity_id, :project_id)
  end
end
