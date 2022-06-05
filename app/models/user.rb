# frozen_string_literal: true

class User < ApplicationRecord
  require 'securerandom'
  has_secure_password

  belongs_to :company, optional: true
  has_many :patients, dependent: :nullify

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
end
