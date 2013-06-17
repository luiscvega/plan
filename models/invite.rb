class Invite < Ohm::Model
  include Ohm::DataTypes
  include Ohm::Timestamps
  include Ohm::Callbacks

  GOING = "going"
  NOT_GOING = "not going"
  PENDING = "pending"

  attribute :status
  attribute :thoughts

  reference :trip, :Trip
  reference :user, :User

  index :status

  def going?; status == GOING; end
  def not_going?; status == NOT_GOING; end
  def pending?; status == PENDING; end

  def full_name
    user.full_name
  end

  def img_url
    user.img_url
  end

  def self.find_or_create(user, trip)
    if invite = Invite.find(user_id: user.id, trip_id: trip.id).first
      return invite
    else
      return create(user: user, trip: trip)
    end
  end

private

  def before_create
    self.status = PENDING
  end

end
