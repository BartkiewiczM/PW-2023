class HomeController < ApplicationController
  def login
    redirect_to user_google_oauth2_omniauth_authorize_path
  end

  def index
    redirect_to new_user_session_path unless current_user
    @opportunities = Opportunity.joins(:project).where(projects: { author_id: current_user&.id })
    @ideas = Idea.joins(:project).where(projects: { author_id: current_user&.id })
    @experiments = Experiment.joins(idea: :project).where(projects: { author_id: current_user&.id })
    @projects = current_user&.projects
  end
end
