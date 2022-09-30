# frozen 
require 'rails_helper'

RSpec.describe BookingsController, type: :controller do
  let(:user) { User.create name: "Cameron", email: "cameron@gmail.com", password: "654321" }

  before do 
    sign_in user
  end

  describe "#index" do
    it "returns 200" do
      get :index

      expect(response).to be_ok
    end

    it "renders the 'index' template" do
      get :index

      expect(response).to render_template("bookings/index")
    end
  end
end