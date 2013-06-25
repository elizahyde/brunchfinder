class Search
  def self.get_brunch(latlng)
    response = HTTParty.get("https://api.foursquare.com/v2/venues/explore?ll=#{latlng}&query=brunch&client_id=#{ENV['FOURSQCLIENTID']}&client_secret=#{ENV['FOURSQCLIENTSECRET']}")
    results = {}

    response["response"]["groups"][0]["items"].each do |f|
      results[f["venue"]["name"]] = {fid:f["venue"]["id"], furl:f["venue"]["canonicalUrl"], faddress:f["venue"]["location"]["address"], fcity:f["venue"]["location"]["city"],
        totalCheckins:f["venue"]["stats"]["checkinsCount"], flat:f["venue"]["location"]["lat"], flng:f["venue"]["location"]["lng"],
        flikes_count:f["venue"]["likes"]["count"], ftips_count:f["venue"]["stats"]["tipCount"],
        fhereNow:f["venue"]["hereNow"]["count"],fphotos_count:f["venue"]["photos"]["count"]}
    end
  return results
  end
# Might be US only: price_tier:f["price"]["tier"], open_now:["hours"]["isOpen"]

  def self.get_bloodies(latlng)
    response = HTTParty.get("https://api.foursquare.com/v2/venues/explore?ll=#{latlng}&query=brunch,bloody+mary&client_id=#{ENV['FOURSQCLIENTID']}&client_secret=#{ENV['FOURSQCLIENTSECRET']}")
    results = {}

    response["response"]["groups"][0]["items"].each do |f|
      results[f["venue"]["name"]] = {fid:f["venue"]["id"], furl:f["venue"]["canonicalUrl"], faddress:f["venue"]["location"]["address"], fcity:f["venue"]["location"]["city"],
        totalCheckins:f["venue"]["stats"]["checkinsCount"], flat:f["venue"]["location"]["lat"], flng:f["venue"]["location"]["lng"],
        flikes_count:f["venue"]["likes"]["count"], ftips_count:f["venue"]["stats"]["tipCount"],
        fhereNow:f["venue"]["hereNow"]["count"],fphotos_count:f["venue"]["photos"]["count"]}
    end
  return results
  end

  def self.get_mimosas(latlng)
    response = HTTParty.get("https://api.foursquare.com/v2/venues/explore?ll=#{latlng}&query=brunch,mimosa&client_id=#{ENV['FOURSQCLIENTID']}&client_secret=#{ENV['FOURSQCLIENTSECRET']}")
    results = {}

    response["response"]["groups"][0]["items"].each do |f|
      results[f["venue"]["name"]] = {fid:f["venue"]["id"], furl:f["venue"]["canonicalUrl"], faddress:f["venue"]["location"]["address"], fcity:f["venue"]["location"]["city"],
        totalCheckins:f["venue"]["stats"]["checkinsCount"], flat:f["venue"]["location"]["lat"], flng:f["venue"]["location"]["lng"],
        flikes_count:f["venue"]["likes"]["count"], ftips_count:f["venue"]["stats"]["tipCount"],
        fhereNow:f["venue"]["hereNow"]["count"],fphotos_count:f["venue"]["photos"]["count"]}
    end
  return results
  end
end