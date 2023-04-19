class OpportunitiesController < ApplicationController
  before_action :authenticate_user!

  def create
    @opportunity = Opportunity.new(opportunity_params)
    @opportunity.project_id = params[:opportunity][:project_id]

    if @opportunity.save
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js   # This will render create.js.erb
      end
    else
      render json: @opportunity.errors, status: :unprocessable_entity
    end
  end

  def new
    @opportunity = Opportunity.new
    @projects = current_user.projects # Fetch projects associated with the current user
  end

  def show
    @opportunity = Opportunity.find(params[:id])
  end

  def edit
    @opportunity = Opportunity.find(params[:id])
  end

  def destroy
    @opportunity = Opportunity.find(params[:id])
    @opportunity.destroy

    respond_to do |format|
      format.turbo_stream
    end
  end

  private

  def opportunity_params
    params.require(:opportunity).permit(:name, :source, :link, :project_id)
  end
end
