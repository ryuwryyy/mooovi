require 'mechanize'
agent = Mechanize.new
page = agent.get('https://app-mooovi.herokuapp.com/works/third_scraping')
elements = page.search('.etc div')
elements.each do |ele|
  puts ele.inner_text
end