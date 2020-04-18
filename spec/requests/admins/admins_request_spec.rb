require 'rails_helper'

RSpec.describe "Admins::Admins", type: :request do

  describe "GET /top" do
    it "returns http success" do
      get "/admins/admins/top"
      expect(response).to have_http_status(:success)
    end
  end

end
