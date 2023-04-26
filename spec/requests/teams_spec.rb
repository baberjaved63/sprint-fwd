require 'rails_helper'

RSpec.describe "Teams", type: :request do
  let!(:teams) { create_list(:team, 4) }
  let(:team) { create(:team) }

  describe "GET /teams" do
    it "returns list of teams" do
      get teams_path, as: :json

      expect(response).to have_http_status(200)
      expect(json_response.count).to eq 4
    end
  end

  describe "GET /teams/:id/members" do
    it "returns list of members of given team" do
      create_list :member, 5, team: team

      get members_team_path(team), as: :json

      expect(response).to have_http_status(200)
      expect(json_response.count).to eq 5
    end
  end
end
