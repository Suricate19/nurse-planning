class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :team
  has_many :patients, through: :team

  has_one_attached :avatar
  has_many :start_journeys, :class_name => "Journey", :foreign_key => "start_user_id"
  has_many :end_journeys, :class_name => "Journey", :foreign_key => "end_user_id"
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  accepts_nested_attributes_for :team
end
