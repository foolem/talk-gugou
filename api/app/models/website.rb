class Website < ApplicationRecord
  searchkick settings: { index: { max_result_window: 500_000 } }

  belongs_to :subject

  def search_data
    attributes.merge(
      subject_name: subject.name
    )
  end
end
