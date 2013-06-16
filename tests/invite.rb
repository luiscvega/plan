require_relative "helper"

test ".find_or_create" do
  user = OpenStruct.new(id: 1)
  trip = OpenStruct.new(id: 1)

  invite = Invite.find_or_create(user, trip)
  assert invite

  same_invite = Invite.find_or_create(user, trip)
  assert_equal invite, same_invite
end
