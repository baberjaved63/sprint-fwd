class ProjectsController < ApplicationController
  include Memberable

  before_action :find_project, except: %i[index new create]
  before_action :find_member, only: %i[add_member]

  def index
    @projects = Project.all
    respond_to do |format|
      format.json { render json: @projects }
    end
  end

  def show
    respond_to do |format|
      format.json { render json: @project }
    end
  end

  def new
    # TODO: Later when views are added
  end

  def edit
    # TODO: Later when views are added
  end

  def create
    @project = Project.new(project_params)
    success = @project.save

    respond_to do |format|
      format.json { json_response @project }
    end
  end

  def update
    success = @project.update(project_params)

    respond_to do |format|
      format.json { json_response @project }
    end
  end

  def destroy
    @project.destroy
    format.json { json_message 'Project destroyed' }
  end

  def add_member
    @project_assignment = ProjectAssignment.new(project: @project, member: @member)
    success = @project_assignment.save

    respond_to do |format|
      format.json { success ? json_message('Member added to project') : json_response(@project_assignment) }
    end
  end

  private

  def entity
    @project
  end

  def find_project
    @project = Project.find(params[:id])
  end

  def find_member
    @member = Member.find(params.require(:member_id))
  end

  def project_params
    params.require(:project).permit(:name)
  end
end
