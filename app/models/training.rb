class Training < ApplicationRecord
    include ActionView::Helpers::UrlHelper

    has_and_belongs_to_many :users
    has_many :likes
    has_many :liking_users, :through => :likes, :source => :user
    has_one :test 
    has_one_attached :image

    validates :name, :description, :url_video, :image, presence: true

    
    def is_liked?(user)
        if self.liking_users.include?(user)
          true
        else
          false
        end
    end
  
    def remove_like(user)
      Like.where(user: user, training: self).first.destroy
  
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
