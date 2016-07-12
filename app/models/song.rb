class Song < ActiveRecord::Base

  validates :title, presence: true, length: { maximum: 40 }
  validates_format_of :url, with: /\A(http(?:s)?).+/ , allow_blank: true
  validates :author, presence: true, length: { maximum: 40 }
end
