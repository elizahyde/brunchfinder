#this is the code with the APIs for searching for brunch locations

# need to search for mimosa, bloodies, eggs, french toastin all results to show icons




class Search
    # perform a general search for brunch
  def self.get_brunch(location)
    # construct a client instance
    client = Yelp::Client.new
    # search for businesses via location (neighbourhood in this situation)
    request = Yelp::V2::Search::Request::Location.new(
      :category_filter => "breakfast_brunch",
      :neighborhood => location,
      :consumer_key => ENV["YELPCONKEY"],
      :consumer_secret => ENV["YELPCONSECRET"],
      :token => ENV["YELPTOKEN"],
      :token_secret => ENV["YELPTOKESECRET"]
    )
    # This line sets a variable 'response' equal to yelp APIs response
    # and goes into the children of 'businesses' as all reponse parmeters
    # we will be using are under that
    response = client.search(request)['businesses']

    # This is where we take the Yelp results parameters and set them equal to
    # our app variable. The first line is because the data that is return is
    # hash. You will see this in the API docs, when testing in Pry, or testing the API
    # in console.
    results = {}
    response.each do |j|
        results["#{j["name"]}"] = {phone:j["display_phone"], url:j["url"]}
    end
    return results


     # rating_img_url_small
     # location.display_address

    # # Yahoo specific deals
     # deals
     # deals.title
     # deals.url
    #  joint_info = {
    #     name: name,
    #     phone: display_phone
    # }

    #  joint_info

  end
end
