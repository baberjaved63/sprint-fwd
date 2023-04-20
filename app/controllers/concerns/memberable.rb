module Memberable
  extend ActiveSupport::Concern

  def members
    @members = entity.members

    respond_to do |format|
      format.json { render json: @members }
    end
  end
end
