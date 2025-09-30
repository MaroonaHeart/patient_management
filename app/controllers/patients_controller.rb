class PatientsController < ApplicationController
  include Paginatable

  before_action :load_patient, only: %i[show bmr_calculations bmi_calculations history]
  before_action :load_patient_presenter, only: %i[bmr_calculations bmi_calculations]

  def index
    @patients, @total_pages, @offset = paginate(Patient.all)

    @patients = @patients.search_by_full_name(params[:full_name]) if params[:full_name].present?
    @patients = @patients.search_by_gender(params[:gender]) if params[:gender].present?

    if params[:start_age].present? || params[:end_age].present?
      @patients = @patients.search_by_age_range(params[:start_age], params[:end_age])
    end
  end

  def show
  end

  def bmr_calculations
    formula_name = params[:formula_name]

    @result = if formula_name == 'mifflin'
                @presenter.calculate_mifflin_san_jor
              elsif formula_name == 'harris_benedict'
                @presenter.calculate_harris_benedict
              else
                return
              end

    @patient.bmr_calculation_histories.create(
      formula: formula_name,
      result: @result
    )

    respond_to do |format|
      format.turbo_stream { render "patients/bmr_calculations/#{formula_name}" }
      format.html { redirect_to patient_path(@patient) }
    end
  end

  def bmi_calculations
    @bmi_calc = @presenter.bmi_calculations

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to patient_path(@patient) }
    end
  end

  def history
    @bmr_calculation_histories, @total_pages, @offset = paginate(@patient.bmr_calculation_histories)
  end

  private

  def load_patient_presenter
    @presenter = PatientPresenter.new(@patient)
  end

  def load_patient
    @patient = Patient.find(params[:id])
  end
end
