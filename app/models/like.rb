class Like < ApplicationRecord
  belongs_to :user, dependent: :delete
  belongs_to :training, dependent: :delete
end
