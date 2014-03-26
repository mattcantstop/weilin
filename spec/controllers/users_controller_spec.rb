require 'spec_helper'

describe UsersController, :type => :request do
  render_views

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
    let!(:user) { FactoryGirl.create(:user) }
    before { get :show, :id => user.id }

    it "responds with a 200 response" do
      expect(response.status).to eq(200)
    end

    it "finds the authentication_token" do
      binding.pry
      JSON.parse(response.body)["user"]["authentication_token"].should eq(user[:authentication_token])
    end
  end


end
