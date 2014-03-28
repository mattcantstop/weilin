require 'spec_helper'

describe SessionsController, :type => :request do

  before do
    described_class.any_instance.stub(:user).and_return(user)
  end

  let!(:session_params_with_password) { { :email => user.email, :password => user.password } }
  let!(:session_params_with_auth_token) { { :email => user.email, :authentication_token => user.authentication_token } }

  describe "#create" do
    it "lets request with a username/password through" do
      post :create, sessions_params_with_password
      expect(response.status).to eq(201)
    end
  end


end
