require 'digest'

class Member
  include ActiveGraph::Node
  property :name, type: String
  property :url, type: String
  property :short_url, type: String

  has_many :out, :friends, type: :FRIEND, model_class: self, labels: false, unique: true
  has_many :out, :headlines, type: :connection, model_class: 'Headline'

  validates :name, presence: true
  validates :url, presence: true

  before_save() {
    # Create short urls
    self.short_url = Digest::SHA1.hexdigest(url)[8..16]
  }

  after_save() {
    # Parse through the member url and retrieve header tag content
    UrlHeaderTagCrawlerWorker.perform_async(self.id)
  }

  def all_except_self
    members = Member.all.reject{|m| m == self }
  end
end
