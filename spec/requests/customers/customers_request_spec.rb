require 'rails_helper'

RSpec.describe "Customers::Customers", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/customers/customers/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/customers/customers/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /top" do
    it "returns http success" do
      get "/customers/customers/top"
      expect(response).to have_http_status(:success)
    end
  end

end
