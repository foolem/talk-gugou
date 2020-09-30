class SubjectsController < ApplicationController
  # GET /subjects
  def index
    render json: Subject.all
  end
end
