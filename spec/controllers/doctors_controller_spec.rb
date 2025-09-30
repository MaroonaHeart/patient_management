# frozen_string_literal: true

require 'rails_helper'
RSpec.describe DoctorsController, type: :controller do
  describe 'GET #index' do
    subject(:index) { get :index, params: params }
    let(:params) { {} }

    before { create_list(:doctor, 12) }

    context 'when pagination params is valid' do
      it 'assigns attributes for default page' do
        index

        expect(assigns(:doctors)).to be_present
        expect(assigns(:total_pages)).to eq(3)
        expect(assigns(:offset)).to eq(0)
        expect(assigns(:doctors).size).to eq(5)
      end
    end

    context 'when pagination params for last page' do
      let(:params) { { page: '3' } }

      it 'paginates correctly for last page with fewer records' do
        index

        expect(assigns(:offset)).to eq(10)
        expect(assigns(:doctors).size).to eq(2)
      end
    end

    context 'when pagination params is invalid' do
      let(:params) { { page: 'testt' } }

      it 'raises ArgumentError' do
        expect { subject }.to(raise_error(ArgumentError, 'Invalid page parameter: testt'))
      end
    end
  end
end
