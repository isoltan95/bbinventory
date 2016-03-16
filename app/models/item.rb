class Item < ActiveRecord::Base
  belongs_to :category

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
  scope :by_search, -> (search) { where("name LIKE ?", "%#{search}%") }
  scope :for_gender, -> (gender) { where(gender: gender) }
  scope :by_code, -> (code) { where("code LIKE ?", code) }
  scope :alphabetical, -> { order(:name) }
  scope :for_category, -> (category) { joins(:category).where(name: category) }

  def self.options_for_category
  	['Coloring book', 'Snack', 'Dental item', 'Big item', 'Reading book']
  end

end
