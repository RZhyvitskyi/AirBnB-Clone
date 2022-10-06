require 'rails_helper'

RSpec.describe User, type: :model do
  context "valid Factory" do
    it "has a valid factory" do

      expect(FactoryBot.build(:user)).to be_valid
    end
  end

  context "when user has no roles" do
    it "adds an error message" do
      model = User.new(email: "qais@gmail.com", password: "123123")
      model.save
      model.roles = []
      model.save

      expect(model.errors.full_messages).to include("Roles Must have at least one role")
    end
  end

  context "when user has a role" do
    it "is a valid user" do
      user = FactoryBot.build(:user)
      user.save

      expect(user.errors).not_to include("Must have at least one role")
    end
  end
end