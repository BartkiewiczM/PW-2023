class Idea < ApplicationRecord
  belongs_to :opportunity, optional: true
  belongs_to :project
  has_and_belongs_to_many :categories, join_table: :ideas_categories
  has_many :experiments, dependent: :destroy
end
