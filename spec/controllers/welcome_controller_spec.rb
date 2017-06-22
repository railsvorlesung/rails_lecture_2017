require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do
  before do
    allow(controller).to receive(:authenticate_user!).and_return(true)
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

end
