class PagesController < ApplicationController
	before_filter :authenticate_user!, except: [:home, :test]
  respond_to :html

  def home
  	if user_signed_in?
  		redirect_to pages_dashboard_path
  	end
  end

  def dashboard
  	@to_do = Project.where(situation: "To-Do")
    @doing = Project.where(situation: "Doing")
    @done = Project.where(situation: "Done")
  	@tasks = Task.all
    respond_with(@projects)
  end

end