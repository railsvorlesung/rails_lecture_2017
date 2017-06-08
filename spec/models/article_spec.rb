require 'rails_helper'

RSpec.describe Article, type: :model do
  subject { FactoryGirl.build(:article) }

  it 'should save the article to db' do
    expect(subject.save).to be(true)
  end


  describe 'validations' do
    subject {Article.new}

    it 'should validate presence' do
      is_expected.to validate_presence_of(:title)
      is_expected.to validate_presence_of(:body)
    end
  
    it 'should validate length of title' do
      is_expected.to validate_length_of(:title).is_at_least(5)
    end
  end # describe      'validations'
end
