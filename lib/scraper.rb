require 'open-uri'
require 'nokogiri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    html = open(index_url)
    doc = Nokogiri::HTML(html)
    students = {}

# Student Name: doc.css("h4").first.text
# Location: doc.css("p").first.text
#Link to Page: doc.css("a")[1].attr("href")
# Collection: doc.css(".roster-cards-container")

# Expected return: an array of hashes in which each hash represents one student
# Iterate through the students:
    doc.css(".roster-cards-container").each do |student|
          # student = Student.new
          students = {
            :name => doc.css("h4").text
           :location => doc.css("p").first.text
           :profile_url => doc.css("a")[1].attr("href")
          }

        end
    # {:name => doc.css("h4").text, :location => doc.css("p").text, :profile_url => doc.css("a")[1].attr("href")}
  end

  def self.scrape_profile_page(profile_url)

  end

end
