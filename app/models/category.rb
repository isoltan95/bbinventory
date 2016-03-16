class Category < ActiveRecord::Base
 #belongs_to :program_category
  has_many :items
end
