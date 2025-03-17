class Bar < ApplicationRecord
  belongs_to :created_by
  serialize :style, JSON
end
