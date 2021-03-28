class Product < ApplicationRecord
  belongs_to :family
  belongs_to :tax_classification
end
