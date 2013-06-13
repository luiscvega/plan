module Routes
  class Users < Cuba
    define do
      on root do
        user_render "index"
      end
    end
  end
end
