require 'rails_helper'

RSpec.describe Project, type: :model do
  describe "must contain name" do
    it "validates presence of name" do
      project = build(:project, name: nil)
      expect(project).not_to be_valid
    end
  end
end
