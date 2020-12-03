class Question < ApplicationRecord
  belongs_to :quiz, dependent: :delete
  has_many :options, dependent: :delete_all
end
