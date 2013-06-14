require_relative "../helper"

scope do
  setup do
    trip = Trip.create
    user = User.create(first_name: "Miguel", last_name: "Vega", email: "miguel@gmail.com", password: "pass1234")
    invite = Invite.create(trip: trip, user: user)

    [trip, user, invite]
  end

  # Scenario 1.A: Invited user DOES NOT have a Tripkada account and IS NOT a PendingUser
  test "GET /trips/1/invites, param('to')" do |trip, user, invite|
    post "/login", email: "miguel@gmail.com", password: "pass1234"

    get "/trips/%s/invites" % trip.id, to: { "0"=>"1580575903" }

    assert_equal PendingUser.all.count, 1
    assert_equal PendingInvite.all.count, 1
  end

  # Scenario 1.B: Invited user DOES NOT have a Tripkada account and IS a PendingUser
  test "GET /trips/1/invites, param('to')" do |trip, user, invite|
    pending_user = PendingUser.create(first_name: "Luis", last_name: "Vega", fb_id: "1580575903")
    PendingInvite.create(pending_user: pending_user, trip: trip)

    post "/login", email: "miguel@gmail.com", password: "pass1234"

    get "/trips/%s/invites" % trip.id, to: { "0"=>"1580575903" }

    assert_equal PendingUser.all.count, 1
    assert_equal PendingInvite.all.count, 1
  end
end
