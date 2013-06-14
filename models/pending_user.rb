class PendingUser < Ohm::Model
  include Ohm::Callbacks
  include Ohm::DataTypes

  attribute :first_name
  attribute :last_name
  attribute :fb_id
  attribute :email

  index :fb_id
end
