class Prescription < ApplicationRecord
  has_many :visits, dependent: :destroy
end
