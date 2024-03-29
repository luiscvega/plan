require_relative "config/settings"
require_relative "shotgun"

Cuba.plugin Cuba::Mote
Cuba.plugin Cuba::TextHelpers
Cuba.plugin Cuba::With
Cuba.plugin Shield::Helpers

# Require all application files.
Dir["./models/**/*.rb"].each  { |rb| require rb }
Dir["./routes/**/*.rb"].each  { |rb| require rb }

# Require all helper files.
Dir["./helpers/**/*.rb"].each { |rb| require rb }
Dir["./filters/**/*.rb"].each { |rb| require rb }
Dir["./workflows/**/*.rb"].each { |rb| require rb }
Dir["./lib/**/*.rb"].each { |rb| require rb }

Cuba.use Rack::MethodOverride
Cuba.use Rack::Session::Cookie,
  key: "tripkada.com",
  secret: "8aa0a37e4342310afdedd3a7407c6ee5fceb5d0b"

Cuba.use Rack::Protection,
  except: [:http_origin, :frame_options, :remote_token]

Cuba.use Rack::Static,
  urls: %w[/js /css /img],
  root: "./public"

Cuba.plugin Helpers

Cuba.define do
  persist_session!

  on "register" do
    run Routes::Register
  end

  on post, "login" do
    if login(User, req[:email], req[:password])

      # If logging-in through Facebook and already has Tripkada account
      if fb_id = session.delete("fb_id")
        current_user.update(fb_id: fb_id)
      end

      res.redirect "/", 303
    else
      res.status = 400
      guest_render "index"
    end
  end

  on authenticated(User) do
    run Routes::Users
  end

  on root do
    guest_render "index"
  end
end
