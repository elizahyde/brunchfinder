class Search
  def self.get_brunch(location)
    # construct a client instance
    client = Yelp::Client.new
    # search for businesses via location (neighbourhood in this situation)
    request = Yelp::V2::Search::Request::Location.new(
      :category_filter => "breakfast_brunch",
      # :tags =>
      :neighborhood => location,
      :consumer_key => ENV["YELPCONKEY"],
      :consumer_secret => ENV["YELPCONSECRET"],
      :token => ENV["YELPTOKEN"],
      :token_secret => ENV["YELPTOKESECRET"]
    )
    response = client.search(request)['businesses']
    results = {}
    response.each do |j|
      results["#{j["name"]}"] = {phone:j["phone"], url:j["url"],
        rating:j["rating_img_url_small"], address:j["location"]["address"], city:j["location"]["city"],
        ydeals:j["deals"], ydealsurl:j["deals.url"], ydeals_title:j["deals.title"]}
    end
    return results

  end

  def self.get_bloodies(location)
    client = Yelp::Client.new
    # search for businesses via location (neighbourhood in this situation)
    request = Yelp::V2::Search::Request::Location.new(
      :category_filter => "breakfast_brunch",
      :term => [ "bloody mary", "bloody marys", "bloody maries" ],
      :neighborhood => location,
      :consumer_key => ENV["YELPCONKEY"],
      :consumer_secret => ENV["YELPCONSECRET"],
      :token => ENV["YELPTOKEN"],
      :token_secret => ENV["YELPTOKESECRET"]
    )

    response = client.search(request)['businesses']

    results = {}
    response.each do |j|
      results["#{j["name"]}"] = {phone:j["phone"], url:j["url"],
        rating:j["rating_img_url_small"], address:j["location"]["address"], city:j["location"]["city"],
         ydeals:j["deals"], ydealsurl:j["deals.url"], ydeals_title:j["deals.title"]}

      end
    return results
  end

  def self.get_mimosas(location)
    # construct a client instance
    client = Yelp::Client.new
    # search for businesses via location (neighbourhood in this situation)
    request = Yelp::V2::Search::Request::Location.new(
      :category_filter => "breakfast_brunch",
      :term => [ "mimosa", "mimosas" ],
      :neighborhood => location,
      :consumer_key => ENV["YELPCONKEY"],
      :consumer_secret => ENV["YELPCONSECRET"],
      :token => ENV["YELPTOKEN"],
      :token_secret => ENV["YELPTOKESECRET"]
    )

    response = client.search(request)['businesses']

    results = {}
    response.each do |j|
      results["#{j["name"]}"] = {phone:j["phone"], url:j["url"],
        rating:j["rating_img_url_small"], address:j["location"]["address"], city:j["location"]["city"],
        ydeals:j["deals"], ydealsurl:j["deals.url"], ydeals_title:j["deals.title"]}
    end
    return results
  end

  def self.get_eggs(location)
    # construct a client instance
    client = Yelp::Client.new
    # search for businesses via location (neighbourhood in this situation)
    request = Yelp::V2::Search::Request::Location.new(
      :category_filter => "breakfast_brunch",
      :term => [ "omelette", "scrambled eggs", "frittata", "eggs"],
      :neighborhood => location,
      :consumer_key => ENV["YELPCONKEY"],
      :consumer_secret => ENV["YELPCONSECRET"],
      :token => ENV["YELPTOKEN"],
      :token_secret => ENV["YELPTOKESECRET"]
    )

    response = client.search(request)['businesses']

    results = {}
    response.each do |j|
      results["#{j["name"]}"] = {phone:j["phone"], url:j["url"],
        rating:j["rating_img_url_small"], address:j["location"]["address"], city:j["location"]["city"],
        ydeals:j["deals"], ydealsurl:j["deals.url"], ydeals_title:j["deals.title"]}
    end
    return results
  end

  def self.get_pancakes(location)
    # construct a client instance
    client = Yelp::Client.new
    # search for businesses via location (neighbourhood in this situation)
    request = Yelp::V2::Search::Request::Location.new(
      :category_filter => "breakfast_brunch",
      :term => "pancakes",
      :neighborhood => location,
      :consumer_key => ENV["YELPCONKEY"],
      :consumer_secret => ENV["YELPCONSECRET"],
      :token => ENV["YELPTOKEN"],
      :token_secret => ENV["YELPTOKESECRET"]
    )

    response = client.search(request)['businesses']

    results = {}
    response.each do |j|
      results["#{j["name"]}"] = {phone:j["phone"], url:j["url"],
        rating:j["rating_img_url_small"], address:j["location"]["address"], city:j["location"]["city"],
        ydeals:j["deals"], ydealsurl:j["deals.url"], ydeals_title:j["deals.title"]}
    end
    return results
  end

end
