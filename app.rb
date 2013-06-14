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

Cuba.use Rack::MethodOverride
Cuba.use Rack::Session::Cookie,
  key: "tripkada.com",
  secret: "8aa0a37e4342310afdedd3a7407c6ee5fceb5d0b"

Cuba.use Rack::Protection
Cuba.use Rack::Protection::RemoteReferrer

Cuba.use Rack::Static,
  urls: %w[/js /css /img],
  root: "./public"

Cuba.plugin Helpers

Cuba.define do
  persist_session!

  on authenticated(User) do
    run Routes::Users
  end

  on post, "login" do
    if login(User, req[:email], req[:password])
      res.redirect "/", 303
    else
      res.status = 400
      guest_render("login")
    end
  end

  on root do
    render "index"
  end
end
