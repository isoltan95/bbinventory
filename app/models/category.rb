class Category < ActiveRecord::Base
 #belongs_to :program_category
  has_many :items

  # Scopes
  scope :alphabetical, -> { order(:name) }
  
  # Validations
  validate :category_is_not_a_duplicate, on: :create

  def already_exists?
    Category.where(name: self.name).size == 1
  end
  
  def category_name
    "#{self.name}"
  end
  
  # Other methods
  private

  def category_is_not_a_duplicate
  	return true if !self.already_exists?
    if self.already_exists?
      errors.add(:category, "#{self.name} already exists")
    end
  end
end
