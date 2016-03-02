class Account < ActiveRecord::Base
  has_many :decrees

  validates :number, :name, :accounttype, presence: true

  def full_name
    "#{number} - #{name}"
  end

  def sum_entries(type)
    self.decrees.where(decreetype: type).sum(:amount)
  end

  def adjust_balance(type)
    if type == 'DT'
      self.sum_entries(type) + self.dt_opening
    elsif type == 'CT'
      self.sum_entries(type) + self.ct_opening
    end
  end

  def show_balance(type)
    if type == 'DT'
      if adjust_balance('DT') > adjust_balance('CT')
        adjust_balance('DT') - adjust_balance('CT')
      else
        0
      end
    elsif type == 'CT'
      if adjust_balance('CT') > adjust_balance('DT')
        adjust_balance('CT') - adjust_balance('DT')
      else
        0
      end
    end
  end

  def sum_dt

  end

end
