class Sort

def compare_results
  # First compare (y)elp result address with (f)oursquare [specific to button push].
  yelp_results.each do  #yelp_results is an array of hashes
    if yaddress == faddress
      top_results # new array with just results that are yelp & 3sq. do get info.



      # Hit up 4sq again for deets
      venueids = @fids.join(",/venue/")

      https://api.foursquare.com/v2/multi?requests=/venues/[venueids]&client_id=QAMMWL3IPTD0FRUH0DZLPKRHKQOHPF1GAHNJT0UR0XPPZGFL&client_secret=G5NQIEOK2UT3CO454VCXQVU2HFRXA4M4FNTPZOXAOWCBHQXO&v=20130623

      Need from multi:
      flikes_count:f["likes"]["count"], ftips_count:f["tips"]["count"], fphotos_count:f["photos"]["count"],fhereNow:f["hereNOw"]["count"],
      # fpopactions = 2*ftips_count + flikes_count + 2*fphotos_count
      joint_info = {name:name,
                    distance:distance,
                    address:yaddress,
                    yrating:yrating,
                    action_score:fpopactions,
                    furl:furl
      }
      joint_info
    else #no matches of 4sq and yelp
      yelp_results # give
    end
end

def sort_top_results
  # Metrics for top results: ftips_count, flikes_count, fhereNow_count, fphotos_count
  # Might throw in yelp rating. Prob not in phase 1.


  top_results.sort_by(fpopactions)


end
# The core data I need for results page for display and sorting
# joint_info = {name:name,
#               distance:distance,
#               address:yaddress,
#               yrating:yrating,
#               action_score:fpopactions,
#               furl:furl
# }

# joint_info


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

  response.each do |j|

  results = {}

    results["#{j["name"]}"] = {phone:j["phone"], url:j["url"], distance:j["distance"]
      yrating:j["rating_img_url_small"], yaddress:j["location"]["address"], city:j["location"]["city"]}


  joint_info = {name:name,
                distance:distance,
                address:yaddress,
                yrating:yrating,
                action_score:fpopactions,
                furl:furl
  }

  joint_info
  end
end
