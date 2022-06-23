# frozen_string_literal: true

class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :destroy]

  def index
    render json: Company.includes(users: [:patients]).all, each_serializer: CompanySlimSerializer, status: :ok
  end

  def show
    render json: @company, serializer: CompanySerializer, status: :ok
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      render json: @company, status: :created
    else
      render json: { errors: @company.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy

  end

  private

  def company_params
    params.permit(:name)
  end

  def set_company
    @company = Company.find(params[:id])
  end
end