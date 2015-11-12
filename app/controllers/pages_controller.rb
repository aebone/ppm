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
  	@tasks =  Task.all
    respond_with(@projects)
  end

end