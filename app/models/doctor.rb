# frozen_string_literal: true

class Doctor < ApplicationRecord
  has_many :patients_doctors
  has_many :patients, through: :patients_doctors

  validates :first_name, :last_name, :middle_name, presence: true

  def full_name
    [first_name, last_name, middle_name].join(' ')
  end
end
