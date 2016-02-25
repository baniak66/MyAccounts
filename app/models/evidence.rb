class Evidence < ActiveRecord::Base
  belongs_to :contractor
  has_many :decrees

  validates :number, :madedate, :amount, :description, presence: true
end
