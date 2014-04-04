require "spec_helper"

describe WarsController, :type => :request do
  render_views

  describe "#create" do
    let!(:war) {
      {
        :name => "Ping Pong",
        :has_end => true,
        :ending_date => nil,
        :ending_score => 10,
        :open_registration => false,
        :private => false,
        :prize => "The Office Trophy of Honour and Fame",
        :is_complete => false,
        :winner_id => nil,
        :is_disabled => false
      }
    }
    context "with valid attributes" do

      it "responds with a 201 status upon successful creation" do
        post :create, :war => war, :user_id => :owner_id
        expect(response.status).to eq(201)
      end
    end

    context "with invalid attributes" do
      it "responds with a 422 when missing an owner_id" do
        post :create, :war => war, :user_id => :owner_id
        expect(response.status).to eq(422)
      end

    end

  end
end
