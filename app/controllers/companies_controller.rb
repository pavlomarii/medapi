class CompaniesController < ApplicationController
  skip_before_action :authenticate_request

  def index
    render json: Company.includes(users: [:patients]).all, status: :ok
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      render json: @company, status: :created
    else
      render json: { errors: @company.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def company_params
    params.permit(:name)
  end
end