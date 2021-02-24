class Headline 
  include ActiveGraph::Node
  property :heading, type: String

  has_many :in, :experts, type: :connection, model_class: 'Member'

  validates :heading, presence: true

  def self.build_headers(member)
    headers = ParseHeaders.retrieve(member.url)

    headers.each do |h|
      headline = Headline.create(heading: h)
      member.headlines << headline
    end
  end
end
