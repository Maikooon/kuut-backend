class GoogleLoginApiController < ApplicationController
  include ActionController::Cookies

  # skip_before_action :verify_authenticity_token, only: [ :callback ]

  require "googleauth/id_tokens/verifier"

  before_action :verify_g_csrf_token

  def callback
    # payload = Google::Auth::IDTokens.verify_oidc(params[:credential], aud: "8037899288-n7t6njqchdp9236shbkjkf5njlf7hc2i.apps.googleusercontent.com")
    # user = User.find_or_create_by(email: payload["email"])
    # session[:user_id] = user.id
    redirect_to after_login_path, notice: "loginしました"
  end

  private

  def verify_g_csrf_token
    if cookies["g_csrf_token"].blank? || params[:g_csrf_token].blank? || cookies["g_csrf_token"] != params[:g_csrf_token]
      redirect_to after_login_path, notice: "不正なアクセスです"
    end
  end
end
