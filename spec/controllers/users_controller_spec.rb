require 'spec_helper'

describe UsersController, :type => :request do
  render_views

  let!(:user) { FactoryGirl.create(:user) }
  let!(:deleting_user) { FactoryGirl.create(:user) }
  let!(:valid_attributes) {
    { :user => {
      :first_name           => "Walter",
      :last_name            => "White",
      :username             => "mattcantstop",
      :email                => "matthewlduff@gmail.com",
      :authentication_token => "KJ342525KJKJKLKLGHGUYIU7898056"
      }
    }
  }

  let!(:updated_params) { { :user => { :username => "Skinny Pete"} } }

  describe "#create" do
    before { post :create, valid_attributes }
    it "creates a user with valid attributes" do
      expect(response.status).to eq(201)
    end

    it "the first names match" do
      JSON.parse(response.body)["user"]["first_name"].should eq(valid_attributes[:user][:first_name])
    end
  end

  describe "#show" do
    before { get :show, :id => user.id }

    it "responds with a 200 response" do
      expect(response.status).to eq(200)
    end

    it "finds the authentication_token" do
      JSON.parse(response.body)["user"]["authentication_token"].should eq(user[:authentication_token])
    end
  end

  describe "#update" do
    before { put :update, :id => user.id, :user => updated_params }

    it "returns a 200 on successful update" do
      expect(response.status).to eq(200)
    end
  end

  describe "#delete" do
    it "returns a 204 response when a user is disabled" do
      delete :destroy, :id => deleting_user.id
      expect(response.status).to eq(204)
    end
  end

end
