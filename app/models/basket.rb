class Basket < ApplicationRecord
  has_many :apples, dependent: :destroy
end
