module Sinatra
  module NAME
    module Helpers
      def auth_required
        redirect('/login') unless logged_in?
      end

      def admin_required
        redirect('/admin/login') unless is_admin? && logged_in?
      end

      def logged_in?
        return !!session[:user_id]
      end

      def is_admin?
        return !!session[:admin]
      end
    end
  end
end