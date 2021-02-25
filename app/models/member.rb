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
    self.short_url = Digest::SHA1.hexdigest(url)[8..16]
  }

  def all_except_self
    members = Member.all.reject{|m| m == self }
  end
end
