class Account < ActiveRecord::Base
  has_many :decrees

  def full_name
    "#{number} - #{name}"
  end
end
