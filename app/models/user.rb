# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  name            :string           not null
#  email           :string           not null
#  password_digest :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  company_id      :bigint
#  admin           :boolean          default(FALSE), not null
#  superadmin      :boolean          default(FALSE), not null
#
# Indexes
#
#  index_users_on_company_id       (company_id)
#  index_users_on_email            (email) UNIQUE
#  index_users_on_name             (name)
#  index_users_on_password_digest  (password_digest)
#
class User < ApplicationRecord
  require 'securerandom'
  has_secure_password

  belongs_to :company, optional: true
  has_many :patients, dependent: :nullify

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
end
