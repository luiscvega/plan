module Helpers
  def guest_render(template, locals = {})
    render(template, locals, "layouts/guest")
  end

  def user_render(template, locals = {})
    render(template, locals, "layouts/user")
  end

  def current_invite
    @current_invite ||= Invite.find(user_id: current_user.id, trip_id: vars[:trip_id]).first
  end

  def current_user
    @current_user ||= authenticated(User)
  end

  def img_color(status)
    case status
    when Invite::GOING
      "going"
    when Invite::PENDING
      "pending"
    when Invite::NOT_GOING
      "not-going"
    end
  end

  def status_sign(status)
    case status
    when Invite::GOING
     '<i class="icon-large icon-ok-sign" style="color: #2ecc71;"></i>'
    #when Invite::PENDING
     #'<i class="icon-large icon-question-sign" style="color: #f1c40f;"></i>'
    when Invite::NOT_GOING
     '<i class="icon-large icon-remove-sign" style="color: #e74c3c;"></i>'
    end
  end
end

