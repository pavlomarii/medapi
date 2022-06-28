# frozen_string_literal: true

# == Schema Information
#
# Table name: patients
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  email      :string
#  phone      :string
#  blood_type :integer
#  rhesus     :boolean
#  user_id    :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_patients_on_email    (email)
#  index_patients_on_name     (name)
#  index_patients_on_phone    (phone)
#  index_patients_on_user_id  (user_id)
#
class Patient < ApplicationRecord
  belongs_to :user
  has_many :laboratory_sets, dependent: :destroy
end
