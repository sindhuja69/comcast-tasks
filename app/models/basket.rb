class Basket < ApplicationRecord
  include Blending
  has_many :apples, dependent: :destroy
end
