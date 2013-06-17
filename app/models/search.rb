#this is the code with the APIs for searching for brunch locations


# perform a general search for brunch
def get_brunch
    client = Yelp::Client.new
    request = Yelp::V2::Search::Request::Location.new(
                :category_filter => "breakfast_brunch"
                :location => location,
                :consumer_key => YELPCONKEY,
                :consumer_secret => YELPCONSECRET,
                :token => YELPTOKEN,
                :token_secret => YELPTOKESECRET)
     response = client.search(request)
end