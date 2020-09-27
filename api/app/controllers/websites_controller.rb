class WebsitesController < ApplicationController
  before_action :set_search, only: [:index]

  # GET /websites
  def index
    render json: search_payload
  end

  private

    def set_search
      @search ||= Searching::Website.new(website_params[:term], website_params[:query]).call
    end

    def search_payload
      {
        results: @search.results,
        total: @search.aggs['id']['sum_other_doc_count'],
        oldest: @search.aggs['oldest']['value_as_string'],
        newest: @search.aggs['newest']['value_as_string'],
        subjects_count: @search.aggs['subject_id']['buckets'].count,
      }
    end

    def website_params
      params.require(:website).permit(:term, query: {})
    end
end
