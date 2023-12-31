module CheckAuthentication
  extend ActiveSupport::Concern

  included do
    before_action :authenticate_user!, unless: :auth_controller
  end

  def authenticate_user!
    return if current_user

    render json: error_hash, status: :unauthorized and return
  end

  def current_user
    @current_user ||= determine_current_user
  end

  def render_auth_hash(user)
    token = JsonWebToken.encode(user_id: user.id)
    time = Time.current + 24.hours.to_i
    render json: {
      user: UserSerializer.render(user),
      token: token, exp: time.strftime("%m-%d-%Y %H:%M")
    }
  end

  private

  def determine_current_user
    return unless auth_params

    User.find(auth_params[:user_id])
  end

  def auth_controller
    controller_name.in?(%w(sessions registrations))
  end

  def auth_params
    auth_header = request.headers["Authorization"]
    token = auth_header.split.last
    JsonWebToken.decode(token)
  rescue StandardError
    nil
  end

  def error_hash
    { error: "You are not authorized to view this resource" }
  end
end