class Quiz < ApplicationRecord
  belongs_to :training, dependent: :destroy
  has_many :questions, dependent: :destroy
end
