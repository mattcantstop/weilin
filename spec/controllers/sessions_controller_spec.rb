require 'spec_helper'
include Warden::Test::Helpers

describe SessionsController, :type => :request do

  let!(:user_with_password) { double('user', :password => "password") }

  describe "#create" do
    it "lets request with a password through" do
      post :create, :user_id => user_with_password, :password => user_with_password.password
      expect(response.status).to eq(201)
    end

    it "returns a 400 when the email is not present" do
      ## Email not present example
    end
  end

# Need to add finding by email then authenticating with password or authentication_token

end
