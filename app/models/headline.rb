class Headline 
  include ActiveGraph::Node
  property :heading, type: String

  has_many :in, :experts, type: :connection, model_class: 'Member'

  validates :heading, presence: true
end
