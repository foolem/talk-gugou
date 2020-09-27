module Searching
  class Website
    attr_reader :term, :query

    def initialize(term = '*', query = {})
      @term = term
      @query = query
    end

    def call
      ::Website.search(term, where: query, aggs: aggs, per_page: 50)
    end

    private

    def aggs
      {
        id: {},
        subject_id: {},
        stars_avg: { avg: { field: :stars } },
        oldest: { min: { field: :published_at, format: 'dd/MM/yyyy' } },
        newest: { max: { field: :published_at, format: 'dd/MM/yyyy' } }
      }
    end
  end
end
