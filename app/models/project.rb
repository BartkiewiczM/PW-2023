class Project < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :goals, dependent: :destroy
  has_many :outcomes, dependent: :destroy
  has_many :opportunities, dependent: :destroy
  has_many :ideas, dependent: :destroy
end
