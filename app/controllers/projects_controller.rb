class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  respond_to :html

  # GET /projects/1
  # GET /projects/1.json
  def show
    redirect_to pages_dashboard_path
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
    @tasks = Task.all
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = current_user.projects.new(project_params)

    respond_to do |format|
      if @project.save
        format.html { redirect_to pages_dashboard_path, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    @project.update(project_params)
    respond_with(@project)
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to pages_dashboard_path, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def change
    @project = Project.find_by_id(params[:id])
    @project.update_attributes(situation: params[:situation])
    respond_to do |format|
      format.html {redirect_to pages_dashboard_path, notice: "Proj Update"}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:title, :description, :expectedDate, :situation, :user_id)
    end

end