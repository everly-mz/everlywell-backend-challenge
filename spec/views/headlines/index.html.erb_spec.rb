require 'rails_helper'

RSpec.describe "headlines/index", type: :view do
  before(:each) do
    assign(:headlines, [
      Headline.create!(
        heading: "Heading"
      ),
      Headline.create!(
        heading: "Heading"
      )
    ])
  end

  it "renders a list of headlines" do
    render
    assert_select "tr>td", text: "Heading".to_s, count: 2
  end
end
