class Invite < Ohm::Model
  include Ohm::Timestamps
  include Ohm::Callbacks

  attribute :status
  attribute :thought

  reference :trip, :Trip
  reference :user, :User

private

  def before_create
    self.status = "pending"
  end

end
