class User < Ohm::Model
  include Ohm::Callbacks
  include Ohm::Timestamps
  include Shield::Model

  unique :email

  attribute :email
  attribute :firstname
  attribute :lastname
  attribute :crypted_password

  collection :invites, :Invite

  def self.fetch(email)
    with(:email, email)
  end

  def full_name
    [firstname, lastname].join(" ")
  end

end
