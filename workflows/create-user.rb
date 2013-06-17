class CreateUser < Scrivener
  attr_accessor :email, :first_name, :last_name,
                :password, :confirm_password, :fb_id

  def validate
    assert_email(:email) && assert_unique(User, :email)
    assert_present(:first_name)
    assert_present(:last_name)
    assert_present(:password)
    assert_equal(:confirm_password, :password)
  end

  def create
    return unless valid?

    user = User.create(
      first_name: first_name,
      last_name: last_name,
      password: password,
      email: email,
      fb_id: fb_id
    )
  end
end
