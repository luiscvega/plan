class PendingInvite < Ohm::Model
  reference :pending_user, :PendingUser
  reference :trip, :Trip
end
