# == Schema Information
#
# Table name: companies
#
#  id            :bigint           not null, primary key
#  name          :string           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  latitude      :decimal(10, 6)
#  longitude     :decimal(10, 6)
#  address       :string
#  phone         :string
#  email         :string
#  website       :string
#  working_hours :time             default([]), is an Array
#
# Indexes
#
#  index_companies_on_address                 (address) UNIQUE
#  index_companies_on_email                   (email) UNIQUE
#  index_companies_on_latitude_and_longitude  (latitude,longitude) UNIQUE
#  index_companies_on_name                    (name) UNIQUE
#  index_companies_on_phone                   (phone) UNIQUE
#  index_companies_on_website                 (website) UNIQUE
#
class CompanySlimSerializer < ActiveModel::Serializer
  include Countable

  attributes :id, :name, :website, :amount_users, :amount_patients
end