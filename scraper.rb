require 'nokogiri'
require 'open-uri'
require 'mechanize'
require 'pry'
require "csv"
require 'uri'


class FetchPrice

  def initialize
    @headline = []
    @agent = Mechanize.new
  end

  def get_links
    mech_page = @agent.get('http://streeteasy.com/for-sale/brooklyn')

    num_pages_to_scrape = 1
    count = 0

    while(num_pages_to_scrape > count)
      page = mech_page.parser

      page.css('div.details-title a').each do |link|  	
      	@headline << "http://streeteasy.com" + link['href']
      end
      binding.pry
      @headline

      count += 1
      mech_page = @agent.get(page.css('.details-title').css('a').last.attributes["href"].value)
    end

    return @headline
  end
end



r = FetchPrice.new
@agent = Mechanize.new  

r.get_links.each do |link| 
  binding.pry
    mech_page = @agent.get("#{link}")   
     list = link.click
     broker = mech_page.search('#agent-promo a').text
     title = mech_page.search('.building-title a').text 
     listing = title + " " + broker 
     # binding.pry
  end

  puts listing



  
  # mech_page = @agent.get("http://streeteasy.com/" + r.get_links[4])
  # page = mech_page.search('#agent-promo a').text

