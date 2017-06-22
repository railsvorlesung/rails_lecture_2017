require 'rails_helper'

RSpec.describe User::ProfilesController, type: :controller do
  let(:user) do
    FactoryGirl.create(:user)
  end

  before do
    allow(controller).to receive(:authenticate_user!).and_return(true)
    allow(controller).to receive(:current_user).and_return(user)
  end

  render_views

  it 'should not redirect with the before action without profiles ' do
    get :new
    expect(response).not_to redirect_to(new_user_profile_path)
  end

  it 'should display successfully the formular' do
    get :new
    expect(response).to be_success
  end

  describe 'POST #create' do
    it 'should create a new profile' do
      post :create, user_profile: FactoryGirl.attributes_for(:user_profile)
      expect(response).to redirect_to(user_profile_url)
      expect(user.reload.user_profile).to be_present
    end
  end
end
