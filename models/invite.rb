class Invite < Ohm::Model
  include Ohm::Timestamps
  include Ohm::Callbacks

  GOING = "going"
  NOT_GOING = "not going"
  PENDING = "pending"

  attribute :status
  attribute :thoughts

  reference :trip, :Trip
  reference :user, :User

  def going?; status == GOING; end
  def not_going?; status == NOT_GOING; end
  def pending?; status == PENDING; end

private

  def before_create
    self.status = PENDING
  end

end
