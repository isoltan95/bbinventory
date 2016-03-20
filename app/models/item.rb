class Item < ActiveRecord::Base
  belongs_to :category
  has_many :basket_items
  has_many :baskets, through: :basket_items
  
  # get an array of gender types
  GENDER_LIST = [['Neutral', 'Neutral'], ['Girl', 'Girl'], ['Boy', 'Boy']]
  # get an array of age category (in years)
  AGE_LIST = [['0-2', '0-2'], ['3-10', '3-10'], ['11-21', '11-21']]

  filterrific(
  	default_settings: { sorted_by: 'name'},
  	available_filters: [
  	  :sorted_by,
  	  :for_category,
  	  :by_search,
  	  :by_barcode,
      :by_age
  	] 
  )

  #scopes
  scope :alphabetical, -> { order(:name) }
  scope :by_search, -> (search) { where("name LIKE ?", "%#{search}%") }
  scope :for_gender, -> (gender) { where(gender: gender) }
  scope :by_barcode, -> (barcode) { where("code LIKE ?", barcode) }
  scope :for_category, -> (category) { joins(:category).where('categories.name = ?', category) }
  scope :by_age, -> (age) { where(age: age) }

  # Validations
  validates_presence_of :barcode, :name, :quantity, :category_id, on: :update
  validates_inclusion_of :gender, in: GENDER_LIST.map{|key, value| value}, message: "is not an option", on: :update
  validates_inclusion_of :age, in: AGE_LIST.map{|key, value| value}, message: "is not an option", on: :update
  validates_numericality_of :quantity, only_integer: true, greater_than_or_equal_to: 1, on: :create
  validates_numericality_of :quantity, only_integer: true, greater_than_or_equal_to: 0, on: :update
  #validate :category_is_in_system, on: :update

  private



end
