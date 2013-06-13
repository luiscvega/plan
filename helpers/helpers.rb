module Helpers
  def guest_render(template, locals = {})
    render(template, locals, "layouts/guest")
  end

  def user_render(template, locals = {})
    render(template, locals, "layouts/user")
  end

  def current_user
    @current_user ||= authenticated(User)
  end
end

