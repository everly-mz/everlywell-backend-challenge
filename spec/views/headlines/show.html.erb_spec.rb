require 'rails_helper'

RSpec.describe "headlines/show", type: :view do
  before(:each) do
    @headline = assign(:headline, Headline.create!(
      heading: "Heading"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Heading/)
  end
end
