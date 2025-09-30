class DoctorsController < ApplicationController
  include Paginatable

  def index
    @doctors, @total_pages, @offset = paginate(Doctor.all)
  end
end
