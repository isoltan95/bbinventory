class Item < ActiveRecord::Base

  filterrific(
  	default_settings: { sorted_by: 'name'},
  	available_filters: [
  	  :sorted_by,
  	  :for_category,
  	  :by_search,
  	  :by_code
  	] 
  )

  #scopes
  scope :for_category, ->(category) { where(category: category) }
  scope :by_search, -> (search) { where("name LIKE ?", "%#{search}%") }
  scope :by_code, -> (code) { where("code LIKE ?", code) }
  scope :alphabetical, -> { order(:name) }

  def self.options_for_category
  	['Coloring book', 'Snack', 'Dental item', 'Big item', 'Reading book']
  end

end
