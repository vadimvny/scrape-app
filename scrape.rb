require 'nokogiri'
require 'open-uri'
require 'csv'
require 'mechanize'
require 'pp'
require 'pry'

agent = Mechanize.new

url = 'http://streeteasy.com/for-sale/brooklyn'
page = agent.get(url)

another_page = true
page_num = 1

while another_page == true
  page.search('div.details-title a').each do |link|
    page_url = link.attr('href')
    listing_page = agent.get("#{page_url}")
   	broker = listing_page.search('div#agent-promo a').text
   	listing = listing_page.search('h1.building-title a').text
   
    puts listing + " " + broker
    

  end
  
  if disabled_right_button.any?
    another_page = false # stops the loop from running again
  else
    page = agent.get("http://streeteasy.com/for-sale/brooklyn?page=#{page_num-1}")
  end

  page_num += 1
end

