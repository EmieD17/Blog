class Article < ApplicationRecord
  include Visible

  has_many :comments, dependent: :destroy
  #has_many :monimages, :as => :imageable
  has_one :monimage, :as => :imageable, dependent: :destroy

  #accepts_nested_attributes_for :monimage

  validates :title, presence: true
  #validates :monimage, presence: true
  validates :body, presence: true, length: { minimum: 10 }
end
