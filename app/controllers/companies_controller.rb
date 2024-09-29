class CompaniesController < ApplicationController
  def index
      if params[:name].present?   # フロントでnameで検索をかけた、名前による部分一致検索を行う
        @companies = Company.where("LOWER(name) LIKE ?", "%#{params[:name].downcase}%")
      else
        @companies = Company.all
      end
      render json: @companies
  end
end
