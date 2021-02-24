class Member 
  include ActiveGraph::Node
  property :name, type: String
  property :url, type: String
  property :short_url, type: String

  has_many :both, :friends, type: :connection, model_class: Member
  has_many :out, :following, type: :connection, model_class: Member
  has_many :in, :followers, type: :connection, model_class: Member

  validates :name, presence: true
  validates :url, presence: true
end
