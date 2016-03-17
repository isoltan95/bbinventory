class Category < ActiveRecord::Base
 #belongs_to :program_category
  has_many :items

  # Scopes
  scope :alphabetical, -> { order(:name) }
  
  # Validations
  validate :category_is_not_a_duplicate, on: :create

  def name
  	"#{self.name}"
  end

  def already_exists?
    Category.where(name: self.name).size == 1
  end
  
  # Other methods
  private

  def category_is_not_a_duplicate
  	returns true if !self.already_exists?
    if self.already_exists?
      errors.add(:category, "#{self.name} already exists")
    end
  end
end
