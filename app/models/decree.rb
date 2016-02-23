class Decree < ActiveRecord::Base
  belongs_to :evidence
  belongs_to :account

  scope :dt, -> { where(decreetype: "DT") }
  scope :ct, -> { where(decreetype: "CT") }
end
