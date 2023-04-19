class Opportunity < ApplicationRecord
  enum source: { source1: 0, source2: 1, source3: 2 }

  belongs_to :outcome, optional: true
  belongs_to :project
  has_many :ideas, dependent: :destroy
end
