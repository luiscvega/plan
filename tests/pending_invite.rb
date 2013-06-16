require_relative "helper"

test ".find_or_create" do
  pending_invite = PendingInvite.find_or_create(fb_id: "123123123", first_name: "Luis", last_name: "Vega")
  assert pending_invite

  same_pending_invite = PendingInvite.find_or_create(fb_id: "123123123", first_name: "Luis", last_name: "Vega")
  assert_equal pending_invite, same_pending_invite
end
