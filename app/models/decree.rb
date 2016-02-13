class Decree < ActiveRecord::Base
  belongs_to :evidence
  belongs_to :account
end
