class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :lists

  after_create :list_creation

  def list_creation
    List.create!(user: self, name: 'blacklist')
    List.create!(user: self, name: 'whitelist')
  end
end
