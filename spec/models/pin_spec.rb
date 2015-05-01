require 'rails_helper'

RSpec.describe Pin, :type => :model do

  context 'valid attributes' do
    let(:pin) {FactoryGirl.build(:pin)}

    it {should validate_presence_of(:title)}
    it {should have_attached_file(:image)}
    it {should validate_attachment_presence(:image)}
  end

  context 'without title' do
    let(:pin) {FactoryGirl.build(:pin,:without_title)}
    it {expect(pin).to be_invalid}
  end

  context 'without image' do
    let(:pin) {FactoryGirl.build(:pin,:without_image)}
    it {expect(pin).to be_invalid}
  end


end
