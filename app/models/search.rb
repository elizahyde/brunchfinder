class Search
  def self.get_foursquare(latlng)
    # instantiate a client (Userless Access)
    client = Foursquare2::Client.new(:client_id => 'QAMMWL3IPTD0FRUH0DZLPKRHKQOHPF1GAHNJT0UR0XPPZGFL', :client_secret => 'G5NQIEOK2UT3CO454VCXQVU2HFRXA4M4FNTPZOXAOWCBHQXO')
    # this is for several appliciable restaurant categories. See 4sq API site for details
    categoryids = '4d4b7105d754a06374d81259,4bf58dd8d48988d1d3941735,4bf58dd8d48988d1dc931735,4bf58dd8d48988d14f941735,4bf58dd8d48988d1c4941735,4bf58dd8d48988d157941735,4bf58dd8d48988d1c2941735,4bf58dd8d48988d1c19417354bf58dd8d48988d1c1941735,4bf58dd8d48988d1c0941735,4c2cd86ed066bed06c3c5209,4bf58dd8d48988d10d941735,4d4ae6fc7a7b7dea34424761,4bf58dd8d48988d155941735,4bf58dd8d48988d10c941735,4bf58dd8d48988d147941735,4bf58dd8d48988d17a941735,4bf58dd8d48988d16d941735,4bf58dd8d48988d143941735,4bf58dd8d48988d16a941735,4bf58dd8d48988d14e941735'
    response = client.search_venues(:radius => 6500, :categoryID => categoryids, :ll => latlng)
    results = {}
    binding.pry
    response["groups"][0]["items"].each do |f|
      results["#{f["name"]}"] = {faddress:f["location"]["address"], fid:f["id"], furl:f["canonicalUrl"]
      }
    end
  return results
  end

  def self.get_brunch(location)
    # construct a client instance
    client = Yelp::Client.new
    # search for businesses via location (neighbourhood in this situation)
    request = Yelp::V2::Search::Request::Location.new(
      :category_filter => "breakfast_brunch",
      :sort => 1,
      :neighborhood => location,
      :consumer_key => ENV["YELPCONKEY"],
      :consumer_secret => ENV["YELPCONSECRET"],
      :token => ENV["YELPTOKEN"],
      :token_secret => ENV["YELPTOKESECRET"]
    )

    response = client.search(request)['businesses']

    yelp_results = {}  # This should be an array of hashes

    response.each do |j|
      yelp_results["#{j["name"]}"] = {phone:j["phone"], url:j["url"], distance:j["distance"],
        yrating:j["rating_img_url_small"], yaddress:j["location"]["address"], city:j["location"]["city"]}



    end
  end



# NEED TO FIX RESULTS CODES BELOW




  def self.get_bloodies(location)
    client = Yelp::Client.new
    # search for businesses via location (neighbourhood in this situation)
    request = Yelp::V2::Search::Request::Location.new(
      :category_filter => "breakfast_brunch",
      :sort => 1,
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
        rating:j["rating_img_url_small"], yaddress:j["location"]["address"], city:j["location"]["city"]}
    end
    return results
  end

  def self.get_mimosas(location)
    # construct a client instance
    client = Yelp::Client.new
    # search for businesses via location (neighbourhood in this situation)
    request = Yelp::V2::Search::Request::Location.new(
      :category_filter => "breakfast_brunch",
      :sort => 1,
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
        rating:j["rating_img_url_small"], yaddress:j["location"]["address"], city:j["location"]["city"]}
    end
    return results
  end

  def self.get_eggs(location)
    # construct a client instance
    client = Yelp::Client.new
    # search for businesses via location (neighbourhood in this situation)
    request = Yelp::V2::Search::Request::Location.new(
      :category_filter => "breakfast_brunch",
      :sort => 1,
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
        rating:j["rating_img_url_small"], yaddress:j["location"]["address"], city:j["location"]["city"]}
    end
    return results
  end

  def self.get_pancakes(location)
    # construct a client instance
    client = Yelp::Client.new
    # search for businesses via location (neighbourhood in this situation)
    request = Yelp::V2::Search::Request::Location.new(
      :category_filter => "breakfast_brunch",
      :sort => 1,
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
        rating:j["rating_img_url_small"], yaddress:j["location"]["address"], city:j["location"]["city"]}
    end
    return results
  end
end
