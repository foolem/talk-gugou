class Subject < ApplicationRecord
  searchkick
  
  has_many :websites
end
