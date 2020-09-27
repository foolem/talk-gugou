class WebsitesController < ApplicationController
  before_action :set_search, only: [:index]

  # GET /websites
  def index
    render json: search_payload
  end

  private

    def set_search
      @search ||= Searching::Website.new(params[:term], params[:query]).call
    end

    def search_payload
      {
        results: @search.results,
        total: @search.total_count,
        stars_avg: @search.aggs['stars_avg']['value'].to_i,
        oldest: @search.aggs['oldest']['value_as_string'],
        newest: @search.aggs['newest']['value_as_string'],
        subjects_count: @search.aggs['subject_id']['buckets'].count,
      }
    end
end
