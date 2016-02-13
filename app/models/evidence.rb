class Evidence < ActiveRecord::Base
  belongs_to :contractor
  has_many :decrees
end
