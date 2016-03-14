class Item < ActiveRecord::Base
  #scopes
  scope :for_category, ->(category) { where(category: category) }
  scope :by_search, -> (search) { where("code LIKE ?", "%#{search}%") }
  scope :alphabetical, -> { order(:name) }

end
