class Player < ApplicationRecord
  belongs_to :list, dependent: :destroy

  validates :name, presence: true
  validates :server, presence: true

end
