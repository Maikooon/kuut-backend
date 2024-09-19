class CompaniesController < ApplicationController
  def index
      companies = Company.all
      render json: companies
  end
end


# ここで定義したおてAPI をReactで側で指定するっl
