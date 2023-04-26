require 'rails_helper'

RSpec.describe Team, type: :model do
  describe "must contain name" do
    it "validates presence of name" do
      team = build(:team, name: nil)
      expect(team).not_to be_valid
    end
  end
end
