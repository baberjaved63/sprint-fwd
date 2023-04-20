class MembersController < ApplicationController
  before_action :find_member, except: %i[index new create]

  def index
    @members = Member.all

    respond_to do |format|
      format.json { render json: @members }
    end
  end

  def show
    respond_to do |format|
      format.json { render json: @member }
    end
  end

  def new
    # TODO: Later when views are added
  end

  def edit
    # TODO: Later when views are added
  end

  def create
    @member = Member.new(member_params)

    success = @member.save
    respond_to do |format|
      format.json { render json: success ? @member : {errors: @member.errors.messages} }
    end
  end

  def update
    success = @member.update(member_params)

    respond_to do |format|
      format.json { render json: (success ? @member : {errors: @member.errors.messages}) }
    end
  end

  def destroy
    @member.destroy

    respond_to do |format|
      format.json { json_message 'Member destroyed!' }
    end
  end

  private

  def find_member
    @member = Member.find(params[:id])
  end

  def member_params
    params.require(:member).permit(:first_name, :last_name, :city, :state, :country, :team_id)
  end
end
