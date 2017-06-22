class Image < ApplicationRecord
  has_attached_file :file, styles: { detail: "460x320>", thumb: "64x64>" }, default_url: ":style/ruby.png"
end
