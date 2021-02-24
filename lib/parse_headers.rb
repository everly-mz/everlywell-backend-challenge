require 'nokogiri'
require 'open-uri'
require 'resolv-replace'


module ParseHeaders
  def self.retrieve(url)
    headers = []
    doc = Nokogiri::HTML(URI.open(url))

    doc.css('h1', 'h2', 'h3').each do |header|
      headers.push(header.text)
    end

    headers
  rescue Exception => e
    puts "Couldn't read \"#{ url }\": #{ e }"
    exit
  end
end