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

end
