require 'rails_helper'

RSpec.describe "Recipelists", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/recipelists/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/recipelists/show"
      expect(response).to have_http_status(:success)
    end
  end

end
