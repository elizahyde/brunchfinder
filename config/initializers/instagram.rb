require "instagram"

    Instagram.configure do |config|

    config.client_id = ENV["INSTACLIENTID"]

    config.access_token = ENV["INSTAACCESSTOKEN"]

 end