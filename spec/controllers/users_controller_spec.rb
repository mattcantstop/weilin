require 'spec_helper'

describe UsersController, :type => :request do
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
    it "creates a user with valid attributes" do
      post :create, valid_attributes
      expect(response.status).to eq(201)
    end
  end


end
