class UserProfile < ApplicationRecord
  belongs_to :user

  has_attached_file :image, styles: { detail: "320x320>", thumb: "64x64>" }, default_url: ":style/ruby.png"

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  validates :user, presence: true


end
