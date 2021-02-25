require 'nokogiri'
require 'open-uri'
require 'resolv-replace'

class UrlHeaderTagCrawlerWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(member_id)
    member = Member.find_by(id: member_id)
    headers = []
    doc = Nokogiri::HTML(URI.open(member.url))

    doc.css('h1', 'h2', 'h3').each do |header|
      headers.push(header.text)
    end

    headers.each do |h|
      headline = Headline.create(heading: h)
      member.headlines << headline
    end
  rescue Exception => e
    Rails.logger.error "Couldn't read \"#{ member.url }\": #{ e }"
  end

end
