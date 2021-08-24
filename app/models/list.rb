class List < ApplicationRecord
  belongs_to :user
  has_many :players, dependent: :destroy

  validates :name, presence: true
end
