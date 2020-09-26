class Website < ApplicationRecord
  searchkick settings: { index: { max_result_window: 500_000 } }, locations: [:location]

  belongs_to :subject

  def search_data
    attributes.merge(
      location: { lat: latitude, lon: longitude }
    )
  end
end
