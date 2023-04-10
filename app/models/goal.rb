class Goal < ApplicationRecord
  belongs_to :project
  has_many :outcomes, dependent: :destroy
end
