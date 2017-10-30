 # require 'mechanize'

 #  links = [http://review-movie.herokuapp.com/products/1] # 個別ページのリンクを保存する配列
 #  agent = Mechanize.new
 #  current_page = agent.get("http://review-movie.herokuapp.com/")
 #  # 個別ページのリンクを取得

 #  links.each do |http://image.eiga.k-img.com/images/movie/82939/poster2/200.jpg?1456105504|
 #    # 個別ページから作品画像のURLを取得
 #  end

  require 'mechanize'

  def scraping_image(link)
    agent = Mechanize.new
    page = agent.get(link)
    image_url = page.at('.entry-content img').get_attribute('src')
    return image_url
  end

  links = [] # 個別ページのリンクを保存する配列
  agent = Mechanize.new
  current_page = agent.get("http://review-movie.herokuapp.com")
  elements = current_page.search('.entry-title a')
  elements.each do |ele|
    links << ele.get_attribute('href')
  end

  links.each do |link|
    puts scraping_image('http://review-movie.herokuapp.com' + link)
  end