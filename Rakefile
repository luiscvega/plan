task :seed do
  require_relative "app"

  Ohm.flush

  user = User.create(firstname: "Luis", lastname: "Vega",
                email: "luis@gmail.com", password: "pass1234")
end

