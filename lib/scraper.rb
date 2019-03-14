require 'open-uri'
require 'nokogiri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    html = open(index_url)
    doc = Nokogiri::HTML(html)
# Student Name: doc.css("h4").first.text
# Location: doc.css("p").first.text
#Link to Page: doc.css("a")[1].attr("href")

    binding.pry
  end

  def self.scrape_profile_page(profile_url)

  end

end
