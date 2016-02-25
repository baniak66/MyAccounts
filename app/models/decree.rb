class Decree < ActiveRecord::Base
  belongs_to :evidence
  belongs_to :account

  validates :amount, :evidence_id, :account_id, presence: true
  validates :decreetype, inclusion: { in: %w(DT CT) }

  scope :dt, -> { where(decreetype: "DT") }
  scope :ct, -> { where(decreetype: "CT") }
end
