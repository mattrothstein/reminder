require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  describe "GET index" do
    it "loads all of current users events" do
      user = FactoryGirl.create(:user)
      sign_in(user)
      events = user.events
      get :index
      expect(assigns(:events)).to eq(events)
    end

    it "renders the index template" do
      user = FactoryGirl.create(:user)
      sign_in(user)
      get :index
      expect(response).to render_template("index")
    end
  end

end
