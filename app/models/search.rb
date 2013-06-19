#this is the code with the APIs for searching for brunch locations

# need to search for mimosa, bloodies, eggs, french toastin all results to show icons


# perform a general search for brunch

class Search

  def self.get_brunch(location)
    # construct a client instance
    client = Yelp::Client.new
    # search for businesses via location (address, neighbourhood, city, state, zip, country,
    request = Yelp::V2::Search::Request::Location.new(
      :category_filter => "breakfast_brunch",
      :neighborhood => location,
      :consumer_key => "ZoD1HJIQ4YBerFDnZayzGg",
      :consumer_secret => "_mGSfN0Ih08OLudwXV0TJkjN9So",
      :token => "0-90jYPKJJSyBbJuz-wFWxCV-DKaoxvH",
      :token_secret => "JDN5T8l7ktPR7g_qhgtIuYJ6068"
    )
    response = client.search(request)['businesses']

    # response.each do |k, v|
    results = {}
    response.each do |j|
        results["#{j["name"]}"] = {phone:j["display_phone"], url:j["url"]

        }
    end
    return results

    # joint_info = {
    #     name: name,
    #     phone: display_phone
    # }
    #  brunchover = response.each do |joint|
    #  # Set variables for results we want to use
    #      name = joint['name']
    #      phone = joint['display_phone']
    #

    #  # rating_img_url_small
    #  # location.display_address

    # # Yahoo specific deals
    #  # deals
    #  # deals.title
    #  # deals.url
    #  joint_info = {
    #     name: name,
    #     phone: display_phone
    # }

    #  joint_info

  end

  # Items needed elsewhere
  # Restaurant url
  # Menu url
  # Other deals
end
