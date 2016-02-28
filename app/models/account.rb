class Account < ActiveRecord::Base
  has_many :decrees

  validates :number, :name, :accounttype, presence: true

  def full_name
    "#{number} - #{name}"
  end
end
