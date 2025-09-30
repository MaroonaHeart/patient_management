# frozen_string_literal: true

class PatientsDoctor < ApplicationRecord
  belongs_to :patient
  belongs_to :doctor
end
