require 'nokogiri'
require 'open-uri'

require_relative './course.rb'

class Scraper

  def print_courses
    self.make_courses
    Course.all.each do |course|
      if course.title && course.title != ""
        puts "Title: #{course.title}"
        puts "  Schedule: #{course.schedule}"
        puts "  Description: #{course.description}"
      end
    end
  end

  def get_page
    page = Nokogiri::HTML(open("http://learn-co-curriculum.github.io/site-for-scraping/courses"))
  end

  def get_courses
    page = Nokogiri::HTML(open("http://learn-co-curriculum.github.io/site-for-scraping/courses"))
    courses = page.css(".posts-holder")
  end

  def make_courses
    self.get_courses.each do |postholder|
      course = course.new
      course.title = postholder.css("h2").text
      course.schedule = postholder.css("date").text
      course.description = postholder.css("p").text
    end
  end
end
