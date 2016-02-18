class Contractor < ActiveRecord::Base
  has_many :evidences
  accepts_nested_attributes_for :evidences

  def full_name
    "#{name}, #{address}, NIP: #{nip}"
  end
end
