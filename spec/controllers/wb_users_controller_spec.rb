require 'spec_helper'

describe WbUsersController do
	describe "GET #index" do # session!
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response.status).to eq(200)
    end
  end
end
