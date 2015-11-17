class PagesController < ApplicationController
	before_filter :authenticate_user!, except: [:home, :test]
  respond_to :html

  def home
  	if user_signed_in?
  		redirect_to pages_dashboard_path
  	end
  end

  def dashboard
  	@to_do = current_user.projects.where(situation: "To-Do")
    @doing = current_user.projects.where(situation: "Doing")
    @done = current_user.projects.where(situation: "Done")
  	@tasks = current_user.tasks.order("created_at")
    respond_with(@projects)
  end

end