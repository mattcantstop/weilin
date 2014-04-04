require "spec_helper"

describe WarsController, :type => :request do
  render_views

  describe "#create" do
    let(:user) { FactoryGirl.create(:user) }
    let!(:war) {
      { :war => {
          :name => "Ping Pong",
          :has_end => true,
          :ending_date => nil,
          :ending_score => 10,
          :open_registration => false,
          :private => false,
          :prize => "The Office Trophy of Honour and Fame",
          :is_complete => false,
          :winner_id => nil,
          :owner_id => user.id,
          :is_disabled => false
        }
      }
    }

    it "responds with a 201 status upon successful creation" do
      post :create, :war => war, :user_id => user.id
      expect(response.status).to eq(201)
    end

  end
end
