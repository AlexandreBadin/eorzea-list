class User < ApplicationRecord

  has_many :lists, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:discord]


  def self.from_omniauth(auth)
    user = User.where(email: auth.info.email).first
    if user
      return user
    else
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.username = auth.extra.raw_info.username
        user.discriminator = auth.extra.raw_info.discriminator
        user.provider = auth.provider
        user.uid = auth.uid
        user.email = auth.info.email
        user.avatar_url = auth.info.image
        user.password = Devise.friendly_token[0, 20]
      end
    end
  end

  after_create :list_creation

  def list_creation
    List.create!(user: self, name: 'blacklist')
    List.create!(user: self, name: 'whitelist')
  end

end
