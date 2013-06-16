class Thought
  def initialize(obj)
    @invite_obj = obj
  end

  def pending_invite?
    @invite_obj.is_a?(PendingInvite)
  end

  def status
    if pending_invite?
      "pending_invite"
    else
      @invite_obj.status
    end
  end

  def full_name
    if pending_invite?
      [@invite_obj.first_name, @invite_obj.last_name].join(" ")
    else
      @invite_obj.full_name
    end
  end

  def img_url
    @invite_obj.img_url
  end

  def text
    @invite_obj.thoughts
  end
end
