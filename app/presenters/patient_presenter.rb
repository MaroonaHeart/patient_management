class PatientPresenter
  BASE_URL = 'https://bmicalculatorapi.vercel.app/api/bmi'
  BASE_HEADERS = { content_type: 'application/json' }.freeze

  def initialize(patient)
    @patient = patient
  end

  def bmi_calculations
    response = request_to_bmicalculatorapi(@patient.weight, @patient.height)
    bmicalculatorapi_response(response.status, response.body)
  end

  def calculate_mifflin_san_jor
    (10 * @patient.weight) + (6.25 * @patient.height) - (5 * @patient.age) + gender_specific_factor(@patient.gender)
  end

  def calculate_harris_benedict
    if @patient.gender == 'male'
      male_harris_benedict(@patient.weight, @patient.height, @patient.age)
    else
      female_harris_benedict(@patient.weight, @patient.height, @patient.age)
    end
  end

  private

  def gender_specific_factor(gender)
    gender == 'male' ? 5 : -161
  end

  def male_harris_benedict(weight, height, age)
    66.473 + (13.752 * weight) + (5.003 * height) - (6.755 * age)
  end

  def female_harris_benedict(weight, height, age)
    655.096 + (9.563 * weight) + (1.85 * height) - (4.679 * age)
  end

  def bmicalculatorapi_response(status, body)
    parse_body = JSON.parse(body)

    if status == 200 && parse_body["Category"].present?
      "Category: #{parse_body['Category']}, bmi: #{parse_body['bmi']}, height: #{parse_body['height']}, weight: #{parse_body['weight']}"
    elsif status == 200
      I18n.t("errors.bmicalculatorapi.response.errors.#{status}")
    else
      I18n.t("errors.bmicalculatorapi.response.errors.#{status}", default: I18n.t('errors.bmicalculatorapi.response.errors.5xx'))
    end
  end

  def request_to_bmicalculatorapi(weight, height)
    api_url = "#{BASE_URL}/#{weight}/#{height}"

    Faraday.get(api_url, BASE_HEADERS)
  rescue Faraday::ConnectionFailed, Faraday::TimeoutError, Faraday::ClientError => e
    OpenStruct.new(status: 500, body: { error: e.message }.to_json)
  end
end
