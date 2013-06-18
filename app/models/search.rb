#this is the code with the APIs for searching for brunch locations

# need to search for mimosa, bloodies, eggs, french toastin all results to show icons


# perform a general search for brunch
class Search

    def get_brunch(location)
        client = Yelp::Client.new
        request = Yelp::V2::Search::Request::Location.new(
                    :category_filter => "breakfast_brunch",
                    :sort => 1,
                    :location => "hayes",
                    :consumer_key => [YELPCONKEY],
                    :consumer_secret => [YELPCONSECRET],
                    :token => [YELPTOKEN],
                    :token_secret => [YELPTOKESECRET]
        )
         response = client.search(request)

        #  # Set variables for results we want to use
        #  name = ['name']
        #  distance ['distance']
        #  # rating_img_url_small
        #  # location.display_address
        #  display_phone = ['phone']
        # # Yahoo specific deals
        #  # deals
        #  # deals.title
        #  # deals.url
         joint_info = {
            name: name,
            distance: distance,
            phone: display_phone
         }

         joint_info
    end

    # Items needed elsewhere
        # Restaurant url
        # Menu url
        # Other deals
end