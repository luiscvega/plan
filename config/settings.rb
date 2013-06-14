module Settings
  File.read("env.sh").scan(/(.*?)="?(.*)"?$/).each do |key, value|
    ENV[key] ||= value
  end

  HOST = ENV["HOST"]
  FB_APP_ID = ENV["FB_APP_ID"]
  FB_APP_SECRET = ENV["FB_APP_SECRET"]
  MALONE_URL = ENV["MALONE_URL"]
  DOMAIN = "tripkada.com"

  module Mail
    FROM = "Tripkada@tripkada.com"
  end

end

