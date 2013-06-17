require_relative "helper"

test "required trip" do
  pending_invite = PendingInvite.new

  assert not(pending_invite.valid?)
end

test ".find_or_create ArgumentError" do
  assert_raise(ArgumentError) do
    PendingInvite.find_or_create(fb_id: "123123123", first_name: "Luis", last_name: "Vega")
  end
end

test ".find_or_create" do
  pending_invite_1 = PendingInvite.find_or_create(trip_id: "1", fb_id: "123123123", first_name: "Luis", last_name: "Vega")
  assert pending_invite_1

  pending_invite_2 = PendingInvite.find_or_create(trip_id: "1", fb_id: "123123123", first_name: "Luis", last_name: "Vega")
  assert_equal pending_invite_1, pending_invite_2
end
