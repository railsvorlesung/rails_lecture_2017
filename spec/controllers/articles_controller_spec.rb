require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  let(:user) do
    FactoryGirl.create(:user)
  end

  before do
    controller.stub(:authenticate_user!).and_return(true)
  end

  describe 'POST#create' do
    it 'should create a article' do
      post :create, params: {article: {title: 'test titel' , body: 'Test'}}
      expect(flash).to be_blank
      expect(response.status).to be(302)
      expect(Article.count).to be(1)
    end
  
  end # describe      'POST#create'


  context 'with logged in user' do
    before do
      controller.stub(:current_user).and_return(user)
    end

    it 'should redirect is user has no profile' do
      get :index
      expect(response).to redirect_to(new_user_profile_path)
    end
  

    context 'with user_profile' do
      before do
        FactoryGirl.create(:user_profile, user: user)
      end

      it 'should not redirect is user has no profile' do
        get :index
        expect(response).not_to redirect_to(new_user_profile_path)
      end

    end # context 'with user_profile'
  end # context 'with logged in user'

end
