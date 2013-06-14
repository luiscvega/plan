class Trip < Ohm::Model
  include Ohm::Timestamps
  include Ohm::DataTypes

  attribute :name
  attribute :destination
  attribute :start_date, Type::Date
  attribute :end_date, Type::Date

  collection :invites, :Invite

  def creator
    invites.first.user
  end

  def has_invites?
    invites.count > 1
  end

end
