class Opportunity < ApplicationRecord
  belongs_to :outcome, optional: true
  belongs_to :project
  has_many :ideas, dependent: :destroy
end
