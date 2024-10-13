require "google-id-token"
class GoogleLoginApiController < ApplicationController
  include ActionController::Cookies
  require "googleauth/id_tokens/verifier"

  before_action :verify_g_csrf_token


  def callback
    credential = params[:credential]
    # Rails.logger.info("Received credential: #{credential}")
    payload = Google::Auth::IDTokens.verify_oidc(credential)
    Rails.logger.info("Decoded payload: #{payload}")
    user = User.find_or_create_by(email: payload["email"])
    session[:user_id] = user.id
    redirect_to after_login_path, notice: "loginしました"
  end

  private

  def verify_g_csrf_token
    if cookies["g_csrf_token"].blank? || params[:g_csrf_token].blank? || cookies["g_csrf_token"] != params[:g_csrf_token]
      # redirect_to after_login_path, notice: "不正なアクセスです"
    end
  end
end
