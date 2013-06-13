module Routes
  class Users < Cuba
    define do

      on "trips" do
        run Routes::Trips
      end

      on root do
        user_render "users/index"
      end
    end
  end
end
