module Routes
  class Register < Cuba
    define do
      on "facebook", param("code") do |code|
        #If user clicks "Login with Facebook", they will ALWAYS be redirected here!

        break unless access_token = Koala::Facebook::OAuth.new(
          Settings::FB_APP_ID, Settings::FB_APP_SECRET,
          Settings::HOST + "/register/facebook/"
        ).get_access_token(code)

        graph = Koala::Facebook::API.new(access_token)
        me = graph.get_object("me")

        # SCENARIO 1: SIGN IN TRIPKADA USER VIA FB_ID
        if user = User.find(fb_id: me["id"]).first
          authenticate(user)

          if user.fb_access_token != access_token
            user.update(fb_access_token: access_token)
          end

          res.redirect "/"

        # SCENARIO 2: LINK TRIPKADA ACCOUNT WITH FACEBOOK ACCOUNT
        elsif authenticated(User)
          current_user.update(fb_id: me["id"], fb_access_token: access_token)

          pending_invites = PendingInvite.find(fb_id: me["id"])

          if pending_invites.any?
            pending_invites.each do |pending_invite|
              pending_invite.register(current_user)
            end
          end

          res.redirect "/"

        # SCENARIO 3: NO USER WITH THAT FB_ID. REGISTER THEM! (But maybe there's a PendingUser!)
        else
          service = CreateUser.new({
            first_name: me["first_name"],
            last_name: me["last_name"],
            email: me["email"],
            fb_id: me["id"]
          })

          if PendingUser.find(fb_id: me["id"]).first
            pending_user_id = PendingUser.find(fb_id: me["id"]).first.id 
          end

          session[:fb_id] = me["id"]
          session[:fb_access_token] = access_token
          session[:pending_user_id] = pending_user_id

          guest_render "register/new", service: service
        end
      end

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
