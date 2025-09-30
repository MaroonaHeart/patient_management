# frozen_string_literal: true

class Patient < ApplicationRecord
  has_many :patients_doctors
  has_many :doctors, through: :patients_doctors
  has_many :bmr_calculation_histories

  validates :first_name, :last_name, :middle_name, :birthday, presence: true
  validates :first_name, uniqueness: { scope: %i[last_name middle_name birthday],
                                       message: 'такой пациент уже существует' }


  def full_name
    [first_name, last_name, middle_name].join(' ')
  end

  scope :search_by_full_name, ->(query) {
    query_search = query.split
    conditions = query_search.map { |term| "first_name LIKE '%#{term}%' OR last_name LIKE '%#{term}%' OR middle_name LIKE '%#{term}%'" }
    where_clause = conditions.join(' OR ')
    where(where_clause)
  }

  scope :search_by_gender, ->(query) {
    where('gender = :gender', gender: query)
  }

  # scope :by_age_range, ->(start_age, end_age) {
  #   # Текущая дата
  #   today = Date.today

  #   # Диапазон дат рождения
  #   if start_age.present?
  #     max_birthday = today - start_age.to_i.years
  #   end

  #   if end_age.present?
  #     min_birthday = today - end_age.to_i.years
  #   end

  #   # Построение условий
  #   query = all
  #   query = query.where('birthday >= ?', min_birthday) if end_age.present? && min_birthday
  #   query = query.where('birthday <= ?', max_birthday) if start_age.present? && max_birthday
  #   query
  # }

  scope :search_by_age_range, ->(start_age, end_age) {
    today = Date.today

    if start_age.present? && end_age.present? && (start_age.to_i == end_age.to_i)
      # Возраст одинаковый — сделаем диапазон дат рождения, покрывающий этот возраст целиком
      max_birthday = today - start_age.to_i.years
      min_birthday = today - (start_age.to_i + 1).years + 1.day

      where(birthday: min_birthday..max_birthday)
    else
      # Диапазон разный
      max_birthday = today - start_age.to_i.years if start_age.present?
      min_birthday = today - end_age.to_i.years if end_age.present?

      query = all
      query = query.where('birthday <= ?', max_birthday) if start_age.present?
      query = query.where('birthday >= ?', min_birthday) if end_age.present?
      query
    end
  }

  def age
    return unless birthday
    # binding.pry

    today = Date.today
    age = today.year - birthday.year
    age -= 1 if today < birthday + age.year
    age
  end
end
