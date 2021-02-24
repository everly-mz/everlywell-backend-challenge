require 'rails_helper'

RSpec.describe "headlines/edit", type: :view do
  before(:each) do
    @headline = assign(:headline, Headline.create!(
      heading: "MyString"
    ))
  end

  it "renders the edit headline form" do
    render

    assert_select "form[action=?][method=?]", headline_path(@headline), "post" do

      assert_select "input[name=?]", "headline[heading]"
    end
  end
end
