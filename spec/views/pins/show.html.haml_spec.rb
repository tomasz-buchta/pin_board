require 'rails_helper'

RSpec.describe "pins/show", :type => :view do
  before(:each) do
    @pin = assign(:pin, Pin.create!(
      :title => "Title",
      :description => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
  end
end
