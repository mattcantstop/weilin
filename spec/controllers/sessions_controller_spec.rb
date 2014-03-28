require 'spec_helper'

describe SessionsController, :type => :request do

  let!(:session_params) { { :email => user.email } }

  describe "#create" do
    it "lets request with a username/password through" do
      post :create, sessions_params
    end
  end


end
