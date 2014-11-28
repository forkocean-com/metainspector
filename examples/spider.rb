# A basic spider that will follow internal links
#
# Usage example:
#
#   ruby spider.rb jaimeiniesta.com

require 'metainspector'

# Two arrays, one for the scraping queue and one for the visited links
queue   = []
visited = []

# Get the starting URL
url = ARGV[0] || (puts "Enter a starting url"; gets.strip)

# Resolve initial redirections
page = MetaInspector.new(url)

# Push this initial URL to the queue
queue.push(page.url)

while queue.any?
  url = queue.pop

  visited.push(url)

  puts "VISITED: #{url}"

  page = MetaInspector.new(url)

  page.links.internal.each do |link|
    queue.push(link) unless visited.include?(link) || queue.include?(link)
  end

  puts "#{visited.size} pages visited, #{queue.size} pages on queue\n\n"
end

puts "\nScraping finished, these are the internal links found:\n\n"
puts visited.sort
