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
    invites.count > 1 || pending_invites.count > 0
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

  def active_thoughts
    going_thoughts + not_going_thoughts
  end

  def going_thoughts
    invites.find(status: Invite::GOING).map do |invite|
      Thought.new(invite)
    end
  end

  def not_going_thoughts
    invites.find(status: Invite::NOT_GOING).map do |invite|
      Thought.new(invite)
    end
  end

  def pending_thoughts
    pending_invite_thoughts_1 = invites.find(status: Invite::PENDING).map do |invite|
      Thought.new(invite)
    end

    pending_invite_thoughts_2 = pending_invites.map do |pending_invite|
      Thought.new(pending_invite)
    end

    [*pending_invite_thoughts_1, *pending_invite_thoughts_2]
  end

end
