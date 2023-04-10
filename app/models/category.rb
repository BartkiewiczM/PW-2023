class Category < ApplicationRecord
  has_and_belongs_to_many :ideas, join_table: :ideas_categories
end
