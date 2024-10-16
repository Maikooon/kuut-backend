class StaticPagesController < ApplicationController
  def before_login
    render json: { message: "Before login" }
  end

  def after_login
    render json: { message: "After login" }
  end
end
