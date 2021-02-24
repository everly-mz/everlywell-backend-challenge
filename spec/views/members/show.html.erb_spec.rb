require 'rails_helper'

RSpec.describe "members/show", type: :view do
  before(:each) do
    @member = assign(:member, Member.create!(
      name: "Name",
      url: "Url",
      short_url: "Short Url"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Url/)
    expect(rendered).to match(/Short Url/)
  end
end
