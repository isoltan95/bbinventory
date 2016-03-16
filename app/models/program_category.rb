class ProgramCategory < ActiveRecord::Base
  belongs_to :program 
  has_many :categories
end
