class Evidence < ActiveRecord::Base
  belongs_to :contractor
  has_many :decrees

  validates :number, :madedate, :amount, :description, presence: true

  def check_balance
    if (self.decrees.dt.sum(:amount) - self.decrees.ct.sum(:amount)) == 0
      true
    else
      false
    end
  end

  def status
    if self.accept?
      "Accepted"
    else
      "Not accepted"
    end
  end

end
