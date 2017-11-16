module ApplicationHelpers
  def login_required
    query = {
        'redirect' => request.path_info
    }.map{|key, value| "#{key}=#{value}"}.join("&")

    redirect("/login?#{query}") unless logged_in?
  end

  def admin_required
    query = {
        'redirect' => request.path_info
    }.map{|key, value| "#{key}=#{value}"}.join("&")

    redirect("/login?#{query}") unless is_admin? && logged_in?
  end

  def logged_in?
    return !!session[:user_id]
  end

  def is_admin?
    return if session[:user_id].nil?

    user = User.sessionAuth(session[:user_id])
    return user && user.role == 'admin'
  end
end