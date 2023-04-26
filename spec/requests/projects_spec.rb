require 'rails_helper'

RSpec.describe "Projects", type: :request do
  let!(:projects) { create_list(:project, 4) }
  let(:project) { create(:project) }

  describe "GET /projects" do
    it "returns list of projects" do
      get projects_path, as: :json

      expect(response).to have_http_status(200)
      expect(json_response.count).to eq 4
    end
  end

  describe "GET /projects/:id/members" do
    it "returns list of members of given project" do
      project.members = create_list(:member, 5)

      get members_project_path(project), as: :json

      expect(response).to have_http_status(200)
      expect(json_response.count).to eq 5
    end
  end
end
