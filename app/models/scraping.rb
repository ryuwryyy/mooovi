# class Scraping
#   def self.movie_urls
#     agent = Mechanize.new
#     links = []
#     next_url = ""

#     while true

#     current_page = agent.get("http://review-movie.herokuapp.com/")
#     elements = current_page.search('.entry-title a')
#     elements.each do |ele|
#       links << ele.get_attribute('href')
#     end

#     next_link = current_page.at('.pagination .next a')
#     break unless next_link
#     next_url = next_link.get_attribute('href')
#   end

#     links.each do |link|
#       get_product('http://review-movie.herokuapp.com/' + link)
#     end
#   end

#   def self.get_product(link)
#     agent = Mechanize.new
#     page = agent.get(link)
#     title = page.at('.entry-title').inner_text if page.at('.entry-title')
#     iamge_url = page.at('.entry-content img')[:scr] if page.at('.entry-content img')
#     director = page.at('.director span').inner_text if page.at('.director span')
#       detail = page.at('.entry-content img').inner_text if page.at('entry-content p')
#       opwn_date = page.at('.date span').inner_text if page.at('date span')

#       product = Product.where(title: title).first_or_initialize
#       product.image_url = image_url
#       product.director = director
#       product.detail = detail
#       product.opwn_date = open_date
#       product.save
#     end

#     end
#     image_url = page.at('.entry-content img')[:src] if page.at('.entry-content img')

#     product = Product.where(title: title, image_url: image_url).first_or_initialize
#     product.save
#   end
# end

  
 class Scraping
  def self.movie_urls
    agent = Mechanize.new
    links = []
    next_url = ""

    while true
      current_page = agent.get("http://review-movie.herokuapp.com/" + next_url)
      elements = current_page.search('.entry-title a')
      elements.each do |ele|
        links << ele.get_attribute('href')
      end

      next_link = current_page.at('.pagination .next a')
      break unless next_link
      next_url = next_link.get_attribute('href')

    end
    links.each do |link|
      get_product('http://review-movie.herokuapp.com' + link)
    end
  end

  def self.get_product(link)
    agent = Mechanize.new
    page = agent.get(link)
    title = page.at('.entry-title').inner_text if page.at('.entry-title')

    image_url = page.at('.entry-content img')[:src] if page.at('.entry-content img')
    director = page.at('.director span').inner_text if page.at('.director span')
    detail = page.at('.entry-content p').inner_text if page.at('.entry-content p')
    open_date = page.at('.date span').inner_text if page.at('.date span')

    product = Product.where(title: title).first_or_initialize
    product.image_url = image_url
    product.director = director
    product.detail = detail
    product.open_date = open_date
    product.save
  end
end