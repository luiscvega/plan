module Routes
  class Users < Cuba
    define do
      on root do
        user_render "users/index"
      end
    end
  end
end
