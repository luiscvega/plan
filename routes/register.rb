module Routes
  class Register < Cuba
    define do

      on post, "signup", param("user") do |dict|
        service = CreateUser.new(dict)

        if user = service.create
          authenticate(user)

          res.redirect "/"
        else
          guest_render "index"
        end
      end

      on get, "signup" do
        guest_render "signup", service: CreateUser.new({})
      end

    end
  end
end
