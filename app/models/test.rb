class Test < ApplicationRecord
  belongs_to :training
  has_many :questions
end
