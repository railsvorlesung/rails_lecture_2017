require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'associations' do
    it 'should belong_to article' do
      is_expected.to belong_to(:article)
    end

  
  end # describe      'associations'
  
end
