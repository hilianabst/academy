class Quiz < ApplicationRecord
  belongs_to :training, dependent: :delete
  has_many :questions, dependent: :delete_all
end
