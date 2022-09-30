# frozen 
require 'rails_helper'

RSpec.describe BookingsController, type: :controller do
  let(:user) { FactoryBot.create(:user) }
  let(:demon) { FactoryBot.create(:demon) }
  let(:booking) { FactoryBot.create(:booking) }

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

  describe "#show" do
    it "returns 200" do
      get :show, params: { id: booking.id }

      expect(response).to be_ok
    end

    it "renders the 'show' template" do
      get :show, params: { id: booking.id }

      expect(response).to render_template("bookings/show")
    end
  end

  
end