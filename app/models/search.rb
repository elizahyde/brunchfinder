class Search
  def self.get_foursquare(latlng)
    # # instantiate a client (Userless Access)
    # client = Foursquare2::Client.new(:client_id => 'QAMMWL3IPTD0FRUH0DZLPKRHKQOHPF1GAHNJT0UR0XPPZGFL', :client_secret => 'G5NQIEOK2UT3CO454VCXQVU2HFRXA4M4FNTPZOXAOWCBHQXO')
    # # this is for several appliciable restaurant categories. See 4sq API site for details
    # categoryids = '4d4b7105d754a06374d81259,4bf58dd8d48988d1d3941735,4bf58dd8d48988d1dc931735,4bf58dd8d48988d14f941735,4bf58dd8d48988d1c4941735,4bf58dd8d48988d157941735,4bf58dd8d48988d1c2941735,4bf58dd8d48988d1c19417354bf58dd8d48988d1c1941735,4bf58dd8d48988d1c0941735,4c2cd86ed066bed06c3c5209,4bf58dd8d48988d10d941735,4d4ae6fc7a7b7dea34424761,4bf58dd8d48988d155941735,4bf58dd8d48988d10c941735,4bf58dd8d48988d147941735,4bf58dd8d48988d17a941735,4bf58dd8d48988d16d941735,4bf58dd8d48988d143941735,4bf58dd8d48988d16a941735,4bf58dd8d48988d14e941735'
    # response = client.search_venues(:radius => 6500, :categoryID => categoryids, :ll => latlng)
    # results = {}

    # response["response"]["groups"][0]["items"][0]["venue"].each do |item|
    #   results[f["name"]] = {fid:f["id"], furl:f["canonicalUrl"], faddress:f["location"]["address"], fcity:f["location"]["city"],
    #   fhereNow:f["hereNOw"]["count"]
  end
# We are going to use http yo
  def self.get_brunch(latlng)

      response = HTTParty.get("https://api.foursquare.com/v2/venues/explore?ll=#{latlng}&query=brunch&client_id=QAMMWL3IPTD0FRUH0DZLPKRHKQOHPF1GAHNJT0UR0XPPZGFL&client_secret=G5NQIEOK2UT3CO454VCXQVU2HFRXA4M4FNTPZOXAOWCBHQXO&v=20130623")
      results = {}

      response["response"]["groups"][0]["items"].each do |f|
        results[f["venue"]["name"]] = {fid:f["venue"]["id"], furl:f["venue"]["canonicalUrl"], faddress:f["venue"]["location"]["address"], fcity:f["venue"]["location"]["city"],
          totalCheckins:f["venue"]["stats"]["checkinsCount"],
          flikes_count:f["venue"]["likes"]["count"], ftips_count:f["venue"]["stats"]["tipCount"],
          fhereNow:f["venue"]["hereNow"]["count"],fphotos_count:f["venue"]["photos"]["count"]}

      end

    return results
  end
# Might be US only: price_tier:f["price"]["tier"], open_now:["hours"]["isOpen"]

  def self.get_bloodies(location)
  end

  def self.get_mimosas(location)
  end

  def self.get_eggs(location)
  end

  def self.get_pancakes(location)
  end
end