class CompanySerializer < ActiveModel::Serializer
  attributes :id, :name, :created_at, :updated_at, :amount_users, :amount_patients

  def amount_users
    object.users.size
  end

  def amount_patients
    object.users.map do |user|
      user.patients.size
    end.sum
  end
end
