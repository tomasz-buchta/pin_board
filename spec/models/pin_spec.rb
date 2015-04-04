require 'rails_helper'

RSpec.describe Pin, :type => :model do
  let(:pin) {FactoryGirl.build(:pin)}

  it 'validates presence of title' do
    expect(pin).to be_valid
  end

end
