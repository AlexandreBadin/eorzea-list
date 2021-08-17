class Player < ApplicationRecord
  belongs_to :list

  validates :name, presence :true
  validates :server, presence :true

end
