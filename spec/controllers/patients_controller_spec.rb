# frozen_string_literal: true

require 'rails_helper'
RSpec.describe PatientsController, type: :controller do
  describe 'GET #index' do
    subject(:index) { get :index, params: params }
    let(:params) { {} }

    before { create_list(:patient, 25) }

    context 'when pagination params is valid' do
      it 'assigns attributes for default page' do
        index

        expect(assigns(:patients)).to be_present
        expect(assigns(:total_pages)).to eq(5)
        expect(assigns(:offset)).to eq(0)
        expect(assigns(:patients).size).to eq(5)
      end
    end

    context 'when pagination params with page 5' do
      let(:params) { { page: '5' } }

      it 'paginates correctly for page 5' do
        index
        expect(assigns(:offset)).to eq(20)
        expect(assigns(:patients).size).to eq(5)
      end
    end

    context 'when pagination params is invalid' do
      let(:params) { { page: 'hello' } }

      it 'raises ArgumentError' do
        expect { subject }.to(raise_error(ArgumentError, 'Invalid page parameter: hello'))
      end
    end
  end

  describe 'POST #bmi_calculations' do
    subject(:post_bmi) { post :bmi_calculations, params: { id: patient.id } }

    let(:patient) { create(:patient) }
    let(:presenter_double) { instance_double('PatientPresenter') }

    before do
      allow(PatientPresenter).to receive(:new).and_return(presenter_double)
      allow(presenter_double).to receive(:bmi_calculations).and_return(0.002)
    end

    it 'calls bmi_calculations' do
      post_bmi
      expect(presenter_double).to have_received(:bmi_calculations)
    end

    it 'checks result' do
      post_bmi
      expect(assigns(:bmi_calc)).to eq(0.002)
    end
  end

  describe 'GET#history' do
    let(:patient) { create(:patient) }
    let(:params) do
      {
        id: patient.id,
        page: page_param
      }
    end

    subject(:history) { get :history, params: params }

    before do
      create_list(:bmr_calculation_history, 9, patient: patient)
    end

    context 'when pagination params is valid' do
      let(:page_param) { '1' }

      it 'assigns attributes for default page' do
        history

        expect(assigns(:bmr_calculation_histories)).to be_present
        expect(assigns(:total_pages)).to eq(2)
        expect(assigns(:offset)).to eq(0)
        expect(assigns(:bmr_calculation_histories).size).to eq(5)
      end
    end

    context 'when pagination params with page 2' do
      let(:page_param) { '2' }

      it 'paginates correctly for page 2' do
        history
        expect(assigns(:offset)).to eq(5)
        expect(assigns(:bmr_calculation_histories).size).to eq(4)
      end
    end

    context 'when pagination params is invalid' do
      let(:page_param) { ':symbol' }

      it 'raises ArgumentError' do
        expect { subject }.to(raise_error(ArgumentError, 'Invalid page parameter: :symbol'))
      end
    end
  end
end
