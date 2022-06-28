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
require "test_helper"

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
