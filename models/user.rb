class User < Ohm::Model
  include Ohm::Callbacks
  include Ohm::Timestamps
  include Shield::Model

  unique :email

  attribute :email
  attribute :firstname
  attribute :lastname
  attribute :crypted_password
  attribute :fb_id

  collection :invites, :Invite

  def self.fetch(email)
    with(:email, email)
  end

  def full_name
    [firstname, lastname].join(" ")
  end

  def fb_linked?
    !!fb_id
  end

  def img_url
    if fb_linked?
      "http://graph.facebook.com/%s/picture" % fb_id
    else
      "http://placehold.it/50x50"
    end
  end

end
