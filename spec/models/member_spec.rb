require 'rails_helper'

RSpec.describe Member, type: :model do
  describe "must contain first name" do
    it "validates presence of first name" do
      member = build(:member, first_name: nil)
      expect(member).not_to be_valid
    end
  end

  describe "must contain last name" do
    it "validates presence of last name" do
      member = build(:member, last_name: nil)
      expect(member).not_to be_valid
    end
  end
end
