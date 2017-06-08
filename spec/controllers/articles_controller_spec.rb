require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do

  describe 'POST#create' do
    it 'should create a article' do
      post :create, params: {article: {title: 'test titel', body: 'Test'}}
      expect(Article.count).to be(1)
      expect(response.status).to be(302)
    end
  
  end # describe      'POST#create'

end
