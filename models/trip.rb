class Trip < Ohm::Model
  include Ohm::Timestamps
  include Ohm::DataTypes

  attribute :name
  attribute :destination
  attribute :start_date, Type::Date
  attribute :end_date, Type::Date

  collection :invites, :Invite
  collection :pending_invites, :PendingInvite

  def creator
    invites.first.user
  end

  def has_invites?
    invites.count > 1
  end

  def thoughts
    invite_thoughts = invites.map do |invite|
      Thought.new(invite)
    end

    pending_invite_thoughts = pending_invites.map do |pending_invite|
      Thought.new(pending_invite)
    end

    [*invite_thoughts, *pending_invite_thoughts]
  end

end
