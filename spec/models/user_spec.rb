require 'rails_helper'

RSpec.describe User, type: :model do
  context "valid Factory" do
    it "has a valid factory" do

    expect(FactoryBot.build(:user)).to be_valid
      end
  end

  context "must have a role" do
    it "validates roles" do
      model = User.new(email: "qais@gmail.com", password: "123123")
      model.save
      model.roles = []
      model.save

    expect(model.errors.full_messages).to include("Roles Must have at least one role")
  end
end

  context "must have a role" do
    it "validates roles" do
      user = FactoryBot.build(:user)
      user.save

    expect(user.errors).not_to include("Must have at least one role")
    end
  end
end