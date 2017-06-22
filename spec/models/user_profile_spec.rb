require 'rails_helper'

RSpec.describe UserProfile, type: :model do

  let(:image_file) do
    File.open(Rails.root.join('app/assets/images/ruby.png'))
  end

  it { is_expected.to validate_presence_of(:user) }


  context 'with blank' do
    subject do
      FactoryGirl.build(:user_profile, {
        :image => image_file
      })
    end

    it 'should store the image correctly' do
      expect(subject.save).to be(true)
    end
  end # context 'with blank'


end
