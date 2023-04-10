class Outcome < ApplicationRecord
  belongs_to :goal, optional: true
  belongs_to :project
  has_many :opportunities, dependent: :destroy
end
