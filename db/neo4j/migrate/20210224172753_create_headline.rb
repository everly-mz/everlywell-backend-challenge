class CreateHeadline < ActiveGraph::Migrations::Base
  disable_transactions!

  def up
    add_constraint :Headline, :uuid
  end

  def down
    drop_constraint :Headline, :uuid
  end
end
