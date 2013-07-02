class Search
  def self.get_brunch(latlng)
    response = HTTParty.get("https://api.foursquare.com/v2/venues/explore?ll=#{latlng}&query=brunch&client_id=#{ENV['FOURSQCLIENTID']}&client_secret=#{ENV['FOURSQCLIENTSECRET']}")
    results = {}

    response["response"]["groups"][0]["items"].first(10).each do |f|
      results[f["venue"]["name"]] =
        {fid:f["venue"]["id"], furl:f["venue"]["canonicalUrl"], fdistance:f["venue"]["location"]["distance"],
         faddress:f["venue"]["location"]["address"], fcity:f["venue"]["location"]["city"],
         totalCheckins:f["venue"]["stats"]["checkinsCount"], flat:f["venue"]["location"]["lat"], flng:f["venue"]["location"]["lng"],
         flikes_count:f["venue"]["likes"]["count"], ftips_count:f["venue"]["stats"]["tipCount"],
         fhereNow:f["venue"]["hereNow"]["count"], fphotos_count:f["venue"]["photos"]["count"]}
        end
    # to search for photos by venue id
    results.each do |k,v|
      begin
        img_response = HTTParty.get("https://api.foursquare.com/v2/venues/#{v[:fid]}/photos?&client_id=#{ENV['FOURSQCLIENTID']}&client_secret=#{ENV['FOURSQCLIENTSECRET']}")
        img_results = {
          :img_url => img_response["response"]["photos"]["groups"][1]["items"][0]["sizes"]["items"][0]["url"]
        }
      rescue
        next
      end
      results[k] = results[k].merge(img_results)
    end
    return results
  end
end