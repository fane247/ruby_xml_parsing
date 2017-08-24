require 'nokogiri'


doc = Nokogiri::XML(open("./bakery.xml"))

# puts doc


# puts doc.css("price")[0].text.gsub('£', '').to_i

# node = doc.css("food").css("price")[0].text

node = doc.xpath("//food")[0].first

puts node


# puts doc.search("name").next_sibling