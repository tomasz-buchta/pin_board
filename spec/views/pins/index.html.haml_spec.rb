require 'rails_helper'

RSpec.describe "pins/index", :type => :view do
  before(:each) do
    assign(:pins, [
      Pin.create!(
        :title => "Title",
        :description => "MyText"
      ),
      Pin.create!(
        :title => "Title",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of pins" do
    render
    assert_select ".pin>.title", :text => "Title".to_s, :count => 2
    assert_select ".pin>.description", :text => "MyText".to_s, :count => 2
  end
end
