
   require 'mechanize'

  agent = Mechanize.new
  page = agent.get("http://review-movie.herokuapp.com/products/22")
  ele = page.at ('.entry-content img')
  puts ele.get_attribute('src')