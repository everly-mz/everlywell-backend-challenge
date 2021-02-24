class CreateMember < ActiveGraph::Migrations::Base
  disable_transactions!

  def up
    add_constraint :Member, :uuid
  end

  def down
    drop_constraint :Member, :uuid
  end
end
