module Countable
  extend ActiveSupport::Concern

  included do
    def amount_users
      object.users.size
    end

    def amount_patients
      object.users.map do |user|
        user.patients.size
      end.sum
    end
  end
end