class Training < ApplicationRecord
    include ActionView::Helpers::UrlHelper

    has_and_belongs_to_many :users, dependent: :delete_all
    has_many :likes, dependent: :delete_all
    has_many :liking_users, :through => :likes, :source => :user
    has_one :quiz, dependent: :delete
    has_one_attached :image, dependent: :delete

    validates :name, :description, :url_video, :image, presence: true

    
    def is_liked?(user)
        if self.liking_users.include?(user)
          true
        else
          false
        end
    end
  
    def remove_like(user)
      Like.where(user: user, training: self).first.delete
  
    end
  
    def add_like(user)
        Like.create(user: user, training: self)
    end
  
    def like_icon(user)
      if is_liked?(user)
        'fas fa-thumbs-up fa-2x'
      else
        'far fa-thumbs-up fa-2x'
      end 
    end


end
