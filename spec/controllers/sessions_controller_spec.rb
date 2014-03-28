require 'spec_helper'

describe SessionsController, :type => :request do

  let!(:user_with_password) { double('user', :password => "password") }

  describe "#create" do
    it "lets request with a password through" do
      binding.pry
      post :create, :user_id => user_with_password, :password => user_with_password.password
      expect(response.status).to eq(201)
    end
  end


end
