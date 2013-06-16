class PendingInvite < Ohm::Model
  reference :trip, :Trip

  attribute :fb_id
  attribute :first_name
  attribute :last_name

  index :fb_id

  def self.find_or_create(args)
    if pending_invite = find(fb_id: args[:fb_id]).first
      return pending_invite
    else
      return create(args)
    end
  end

  def img_url
    "http://graph.facebook.com/%s/picture" % fb_id
  end

  def register(user)
    Invite.create(user: user, trip: trip)

    delete
  end
end
