class PagesController < ApplicationController
	before_filter :authenticate_user!, except: [:home]

  def home
  	if user_signed_in?
  		redirect_to pages_dashboard_path
  	end
  end

  def dashboard
  	@projects = Project.all
  	@tasks = Task.all
  end
end
