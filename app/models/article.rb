class Article < ApplicationRecord
  belongs_to :category
  belongs_to :source
end
