class TeamsController < ApplicationController
  include Memberable

  before_action :find_team, except: %i[index new create]

  def index
    @teams = Team.all

    respond_to do |format|
      format.json { render json: @teams }
    end
  end

  def show
    respond_to do |format|
      format.json { render json: @team }
    end
  end

  def new
    # TODO: Later when views are added
  end

  def edit
    # TODO: Later when views are added
  end

  def create
    @team = Team.new(team_params)
    success = @team.save


    respond_to do |format|
      format.json { json_response @team }
    end
  end

  def update
    success = @team.update(team_params)

    respond_to do |format|
      format.json { json_response @team }
    end
  end

  def destroy
    @team.destroy

    respond_to do |format|
      format.json { json_message'Team destroyed' }
    end
  end

  private

  def entity
    @team
  end

  def find_team
    @team = Team.find(params[:id])
  end

  def team_params
    params.require(:team).permit(:name)
  end
end
