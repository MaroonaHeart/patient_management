# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Patient.create(
  [
    # {
    # first_name: 'Иван',
    # last_name: 'Иванов',
    # middle_name: 'Иванович',
    # birthday: '1984-09-20',
    # gender: 'male',
    # height: 180,
    # weight: 75.5
    # },
    # {
    #   first_name: 'Елена',
    #   last_name: 'Цветкова',
    #   middle_name: 'Александровна',
    #   birthday: '1990-03-15',
    #   gender: 'female',
    #   height: 165,
    #   weight: 60.0
    # },
    # {
    #   first_name: 'Михаил',
    #   last_name: 'Смирнов',
    #   middle_name: 'Петрович',
    #   birthday: '1978-11-05',
    #   gender: 'male',
    #   height: 175,
    #   weight: 80.0
    # },
    # {
    #   first_name: 'Анна',
    #   last_name: 'Кузнецова',
    #   middle_name: 'Викторовна',
    #   birthday: '1992-09-10',
    #   gender: 'female',
    #   height: 170,
    #   weight: 55.5
    # },
    # {
    #   first_name: 'Алексей',
    #   last_name: 'Фетисов',
    #   middle_name: 'Михайлович',
    #   birthday: '1988-01-25',
    #   gender: 'male',
    #   height: 182,
    #   weight: 78.2
    # },
    {
      first_name: 'Алексей',
      last_name: 'Петров',
      middle_name: 'Александрович',
      birthday: '1994-09-25',
      gender: 'male',
      height: 182,
      weight: 80.0
    },
    {
      first_name: 'Никита',
      last_name: 'Ильин',
      middle_name: 'Владимирович',
      birthday: '1995-08-15',
      gender: 'male',
      height: 178,
      weight: 70.0
    },
    {
      first_name: 'Дмитрий',
      last_name: 'Кузнецов',
      middle_name: 'Сергеевич',
      birthday: '1990-07-20',
      gender: 'male',
      height: 185,
      weight: 78.0
    },
    {
      first_name: 'Максим',
      last_name: 'Испольский',
      middle_name: 'Олегович',
      birthday: '1993-11-05',
      gender: 'male',
      height: 180,
      weight: 77.0
    },
    {
      first_name: 'Михаил',
      last_name: 'Федоров',
      middle_name: 'Андреевич',
      birthday: '1992-12-10',
      gender: 'male',
      height: 178,
      weight: 74.0
    },
    {
      first_name: 'Анна',
      last_name: 'Иванова',
      middle_name: 'Петровна',
      birthday: '1994-03-12',
      gender: 'female',
      height: 165,
      weight: 60.0
    },
    {
      first_name: 'Ольга',
      last_name: 'Соколова',
      middle_name: 'Михайловна',
      birthday: '1991-06-30',
      gender: 'female',
      height: 170,
      weight: 65.0
    },
    {
      first_name: 'Дарья',
      last_name: 'Крылова',
      middle_name: 'Игоревна',
      birthday: '1993-09-08',
      gender: 'female',
      height: 168,
      weight: 62.0
    },
    {
      first_name: 'Елена',
      last_name: 'Васильева',
      middle_name: 'Кирилловна',
      birthday: '1992-02-14',
      gender: 'female',
      height: 172,
      weight: 66.0
    },
    {
      first_name: 'Татьяна',
      last_name: 'Морозова',
      middle_name: 'Александровна',
      birthday: '1990-10-22',
      gender: 'female',
      height: 167,
      weight: 61.0
    }
  ]
)

Doctor.create(
  [
    # {
    # first_name: 'Алексей',
    # last_name: 'Новиков',
    # middle_name: 'Сергеевич'
    # },
    # {
    #   first_name: 'Марина',
    #   last_name: 'Васильева',
    #   middle_name: 'Игоревна'
    # },
    # {
    #   first_name: 'Олег',
    #   last_name: 'Крылов',
    #   middle_name: 'Анатольевич'
    # },
    {
      first_name: 'Дмитрий',
      last_name: 'Кравцов',
      middle_name: 'Анатольевич'
    },
    {
      first_name: 'Виталий',
      last_name: 'Белов',
      middle_name: 'Павлович'
    },
    {
      first_name: 'Константин',
      last_name: 'Федосеев',
      middle_name: 'Игоревич'
    },
    {
      first_name: 'Ирина',
      last_name: 'Лебедева',
      middle_name: 'Андреевна'
    }
  ]
)
