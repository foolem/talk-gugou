class WebsitesController < ApplicationController
  before_action :set_website, only: [:show, :update, :destroy]

  # GET /websites
  def index
    @websites = Website.all

    render json: @websites
  end

  private
  
    def website_params
      params.require(:website).permit(:title, :description, :published_at, :latitude, :longitude, :stars, :subject_id)
    end
end
