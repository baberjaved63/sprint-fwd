require 'rails_helper'

RSpec.describe "Members", type: :request do
  let(:member) { create :member }

  describe "GET /members/:id" do
    it "responds with details of given member" do
      get member_path(member), as: :json
      expect(response).to have_http_status(200)
      expect(json_response["first_name"]).to eq member.first_name
      expect(json_response["last_name"]).to eq member.last_name
    end
  end

  describe "POST /members" do
    it "creates a new member with given params" do
      team = create :team
      new_member = build(:member, team: team)
      post members_path, params: {member: new_member.attributes}, as: :json

      expect(response).to have_http_status(201)
      expect(json_response["first_name"]).to eq new_member.first_name
      expect(json_response["last_name"]).to eq new_member.last_name
    end
  end
end
