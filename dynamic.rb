require 'sinatra'
require 'httparty'
require 'nokogiri'

url = "https://miami.craigslist.org/search/sof"
response = HTTParty.get(url)
dom = Nokogiri::HTML(response.body)

# METHOD 1
# This does grab the titles of the jobs
# dom .css('a.hdrlnk').each do |element|
#   puts element.content
# end
# METHOD 2
# This grabs them as well but on a single line
# job_titles = dom.css('a.hdrlnk').map do |element|
#   element.content;end

# METHOD 3
# Simplest version and clearest to me
# this grabs the variable but also subselects the content

job_titles = dom .css('a.hdrlnk').map(& :content)

get '/' do
job_titles
end
