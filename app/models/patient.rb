# frozen_string_literal: true

class Patient < ApplicationRecord
  belongs_to :user
  has_many :laboratory_sets, dependent: :destroy
end