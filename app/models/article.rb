class Article < ApplicationRecord

  has_attached_file :image, styles: { detail: "460x320>", thumb: "64x64>" }, default_url: ":style/ruby.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  validates :title, :body, presence: true
  validates :title, length: {minimum: 5}

  has_many :comments
  has_many :images


  has_one(:last_image,{
    class_name: 'Image'
  } , lambda {
    order(:created_at).limit(1)
  })

  # https://apidock.com/rails/ActiveRecord/NestedAttributes/ClassMethods/accepts_nested_attributes_for
  #
  #
  # {
  # title: 'test',
  # body: 'test,
  # images_attributes: [
  #     {title: 'test', file: <file>},
  #     {title:    nil, file: <file>}
  # ]
  # }
  #
  # 
  accepts_nested_attributes_for(:images, allow_destroy: true, reject_if: lambda { |attributes|
    attributes['title'].blank?
  })


  # Article.image_type('image/png')
  #
  scope :image_type, lambda { |image_type|
    where(image_file_type: image_type)
  }

  scope :from_date, lambda {|date|
    where('created_at >= ?', date)
  }

  # Article.image_type('png').from(Date.yesterday)

  def to_pdf
    PdfArticle.new(self).to_pdf
  end # #to_pdf


end


