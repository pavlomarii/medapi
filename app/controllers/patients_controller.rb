class PatientsController < ApplicationController
  before_action :set_patient, only: [:show, :destroy]

  def index
    @patients = @current_user.patients
    render json: @patients, status: :ok
  end

  def batch_create
    permitted_params
    permitted_params[:_json].each do |data|
      patient = Patient.create({
                       name: data.delete(:name),
                       email: data.delete(:email),
                       phone: data.delete(:phone),
                       blood_type: data.delete(:blood_type),
                       rhesus: data.delete(:rhesus) === 0 ? false : true,
                       user: @current_user})
      set = patient.laboratory_sets.build(data)
      set.save
    end
    render json: {}, status: :ok
  end

  def show
    render json: @user, status: :ok
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :created
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    unless @user.update(user_params)
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
  end

  private

  def permitted_params
    params.permit('_json' => %i[name email phone blood_type rhesus erythrocytes
                                           hemoglobin hematocrit platelets platelet leukocytes
                                           lymphocytes lymphocytes_percents monocytes monocytes_percents
                                           shoe granulocytes granulocytes_percents yuni reticulocytes_sticks segments eosinophils basophils reticulocytes])
  end

  def user_params
    params.permit(:email, :password, :name)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
