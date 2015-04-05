require 'rails_helper'

RSpec.describe "pins/edit", :type => :view do
  before(:each) do
    @pin = assign(:pin, Pin.create!(
      :title => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit pin form" do
    render

    assert_select "form[action=?][method=?]", pin_path(@pin), "post" do

      assert_select "input#pin_title[name=?]", "pin[title]"

      assert_select "textarea#pin_description[name=?]", "pin[description]"
    end
  end
end
