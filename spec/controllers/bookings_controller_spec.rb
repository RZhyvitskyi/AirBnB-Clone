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

  it "assigns 'booking'" do
    get :show, params: { id: booking.id }

    expect(assigns(:booking)).to eq(booking)

  end
  context "when 'id' can't be found" do
    it "raises an error" do

      expect { get :show, params: { id: 1000 } }.to raise_error(
        ActiveRecord::RecordNotFound,
        "Couldn't find Booking with 'id'=1000"
      )
    end
  end

  describe "#new" do
    it "returns status 200" do
      get :new

      expect(response).to be_ok
    end

    it "renders the 'new' template" do
      get :new

      expect(response).to render_template("bookings/new")
    end

    it "assigns 'booking' to new Booking" do
      allow(Booking).to receive(:new).and_return(booking)
      get :new

      expect(assigns(:booking)).to eq(booking)
    end
  end
  
  describe "#search" do
    it "searches for a demon by name" do
    get :search

    expect(Demon.search_by_name(demon.name)).to eq("Ugly demon")
    end
  end

  describe "#create" do
    it "returns 200 status" do
      get :create, params: { demon_id: booking.demon.id, user_id: booking.user.id, from_date: from_date, to_date: to_date  }

      expect(response).to have_http_status(:found)
    end

    it "redirects to Booking" do
      get :create, params: { demon_id: demon.id, user_id: user.id, from_date: from_date, to_date: to_date  }

      expect(response).to redirect_to(booking_path)
    end

    it "creates a new booking" do
      
      expect do
        get :create, params: { demon_id: booking.demon.id, user_id: booking.user.id, from_date: from_date, to_date: to_date  }
      end.to change(Booking, :count).by(1)
    end
  end

  context "when creation of a new booking fails" do
    it "redirects to 'new' page" do
      allow(Booking).to receive(:new).and_return(booking)
      allow(Booking).to receive(:save).and_return(false)

      get :create, params: { demon_id: demon.id, user_id: user.id, from_date: from_date, to_date: to_date  }

      expect(response).to render_template("booking/new")
    end
  end


  

  
end