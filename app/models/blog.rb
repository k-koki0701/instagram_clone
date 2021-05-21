class Blog < ApplicationRecord
  belongs_to :user
  has_many :favorite, dependent: :destroy
end
