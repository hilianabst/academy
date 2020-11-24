class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, :omniauth_providers => [:google_oauth2]
    has_and_belongs_to_many :trainings
    has_many :likes
    has_many :liked_trainings, :through => :likes, :source => :training

    def self.from_omniauth(auth)
      where(email: auth.info.email).first_or_create do |user|
        user.email = auth.info.email
        user.password = Devise.friendly_token[0,10]
      end
    end

end
