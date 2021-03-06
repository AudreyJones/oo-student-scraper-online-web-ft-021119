require 'open-uri'
require 'nokogiri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    html = open(index_url)
    doc = Nokogiri::HTML(html)
    students = []

    doc.css(".roster-cards-container").map do |student_cards|
      student_cards.css(".student-card").each {|student|

        students << {
          :name => student.css("a").css("h4").text,
         :location => student.css("a p").text,
         :profile_url => student.css("a").attr("href").value
        }
      }
    end
    students
  end

  def self.scrape_profile_page(profile_url)
    html = open(profile_url)
    doc = Nokogiri::HTML(html)
    student_info = {}       #(:name, :location, :twitter, :linkedin, :github, :blog, :profile_quote, :bio, :profile_url)

    # student_info[:name] = doc.css("h1.profile-name").text
    # student_info[:location] = doc.css("h2.profile-location").text
    # student_info[:profile_url] = profile_url
    thing = doc.css("div.social-icon-container a")

#Iterate over Social Icons to get links:
    thing.map do |link|
      # binding.pry
      url = link.attributes.first[1].value
      if url.include?("twitter")
        student_info[:twitter] = url
      elsif url.include?("linkedin")
        student_info[:linkedin] = url
      elsif url.include?("github")
        student_info[:github] = url
      else 
        student_info[:blog] = url
      end

    end

    student_info[:profile_quote] = doc.css("div.profile-quote").text #"\"Reduce to a previously solved problem\""
    student_info[:bio] = doc.css("div.bio-content.content-holder p").text

    student_info
  end

end
