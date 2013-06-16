module Routes
  class Invites < Cuba
    define do
      trip = Trip[vars[:trip_id]]

      on put, param("invite") do |dict|
        current_invite.update(dict)

        res.redirect "/trips/%s" % current_invite.trip.id, "303"
      end

      on get, param("to") do |dict|
        fb_ids = dict.values

        fb_ids.each do |fb_id|
          if user = User.find(fb_id: fb_id).first
            invite = Invite.find_or_create(user: user, trip: trip)
          else
            json = JSON.parse(Net::HTTP.get(URI("http://graph.facebook.com/#{fb_id}")))

            pending_invite = PendingInvite.find_or_create(
              fb_id: fb_id,
              trip: trip,
              first_name: json["first_name"],
              last_name: json["last_name"]
            )
          end
        end

        res.redirect "/trips/%s" % trip.id, "303"
      end

    end
  end
end
