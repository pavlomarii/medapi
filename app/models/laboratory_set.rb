# frozen_string_literal: true

# == Schema Information
#
# Table name: laboratory_sets
#
#  id                    :bigint           not null, primary key
#  patient_id            :bigint           not null
#  erythrocytes          :float
#  hemoglobin            :float
#  hematocrit            :float
#  platelets             :float
#  platelet              :float
#  leukocytes            :float
#  lymphocytes           :float
#  lymphocytes_percents  :float
#  monocytes             :float
#  monocytes_percents    :float
#  shoe                  :float
#  granulocytes          :float
#  granulocytes_percents :float
#  yuni                  :float
#  reticulocytes_sticks  :float
#  segments              :float
#  eosinophils           :float
#  basophils             :float
#  reticulocytes         :float
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#
# Indexes
#
#  index_laboratory_sets_on_patient_id  (patient_id)
#
class LaboratorySet < ApplicationRecord
  belongs_to :patient
end
