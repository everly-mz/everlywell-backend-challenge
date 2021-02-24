require 'rails_helper'

RSpec.describe "headlines/new", type: :view do
  before(:each) do
    assign(:headline, Headline.new(
      heading: "MyString"
    ))
  end

  it "renders new headline form" do
    render

    assert_select "form[action=?][method=?]", headlines_path, "post" do

      assert_select "input[name=?]", "headline[heading]"
    end
  end
end
