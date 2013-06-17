#this is the code with the APIs for searching for brunch locations


# perform a general search for brunch
def get_brunch
    client = Yelp::Client.new
    request = Yelp::V2::Search::Request::Location.new(
                :category_filter => "breakfast_brunch"
                :term => ["bloody mary", "bloody marys", "bloody maries"]
                # Location Specifies the combination of "address,
                # neighborhood, city, state or zip, optional
                # country" to be used when searching for businesses.
                :location => "Hayes",
                :consumer_key => YELPCONKEY,
                :consumer_secret => YELPCONSECRET,
                :token => YELPTOKEN,
                :token_secret => YELPTOKESECRET)
     response = client.search(request)
end